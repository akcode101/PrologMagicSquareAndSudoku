
%checks length of a list of lists
checkLengthOfEachList([], _).
checkLengthOfEachList([H|T], SameNumber) :-
	length(H, SameNumber),
	checkLengthOfEachList(T, SameNumber).


%Transpose idea taken from stackoverflow: 
%https://stackoverflow.com/questions/4280986/how-to-transpose-a-matrix-in-prolog

%...........................................
%getFirstColumnAndRest takes a matrix, the first column, and rest of matrix as arguments

getFirstColumnAndRest([], [], []). 
%if we have finished proving all the rows, first column is empty list,  and tail others should also be anpty list

getFirstColumnAndRest([[Head|Tail]|OtherRows],[Head|HeadOthers], [Tail|TailOthers]) :-
%if we are processing a normal matrix, try to match the first row with the head and its lowers,
%as well as the tail and its lowers for the rest of the matrix
	getFirstColumnAndRest(OtherRows, HeadOthers, TailOthers).
	%To prove we have got the first column, we have to prove that given the lower rows, the first column
	%is the head's lowers and the rest of the matrix is the lists below tail.

transpose([[]|_], []). 
%a list of empty right sides in the original matrix corresponds to 0 more rows to process in the transpose

transpose(M, [FirstRow|OtherRows]) :-
	getFirstColumnAndRest(M, FirstRow, RightOfFirstColumn),
	transpose(RightOfFirstColumn, OtherRows).
	%After matching the first row of transpose to first column, match rest of matrix with rest of transpose
%......................................................





remove_first_column([], []).
remove_first_column([[_|Tail]| RestOfRows], [Tail| TailRest]) :-
	remove_first_column(RestOfRows, TailRest).



check_diagonal_sum([], Sum, Sum,  []).
check_diagonal_sum([[Head|Tail]|_], Accumulator, Sum, [Tail|TailOthers]) :-
	remove_first_column(TailOthers, TailOthersSliced),
	Intermediate is Accumulator+Head,
	check_diagonal_sum(TailOthers, Intermediate, Sum, TailOthersSliced).


diag_sum_easy(M, Sum) :-
	remove_first_column(M, SlicedM),
	check_diagonal_sum(M, 0, Sum, SlicedM).

flipMatrixVertically([], []).
flipMatrixVertically([ListOne|ListOthers], [ReversedListOne | ReversedListOthers]) :-
	reverse(ListOne, ReversedListOne),
	flipMatrixVertically(ListOthers, ReversedListOthers).

get_sum(Square, N, Sum) :-
	Sum is (1+Square) * N // 2.

get_square(N, Square) :-
	Square is N*N.





%checks that all members of a list are unique
allUnique([]).
allUnique([H|T]) :- member(H,T), !, fail.
allUnique([_|T]) :- allUnique(T).

%checks that all numbers in a list are between 1 and MaxNumber
checkRange([], _).
checkRange([H|T], MaxNumber) :- between(1, MaxNumber, H), checkRange(T, MaxNumber).

checkLinearSum([], Sum, Sum).
checkLinearSum([H|T], Accumulator, Sum) :- 
	Intermediate is Accumulator+H,
	checkLinearSum(T, Intermediate, Sum).


%checks that a list is a permutation of numbers from 1-X
checkValidList(X, Sum, L):-
	checkCorrectSet(L, X),
	checkLinearSum(L, 0, Sum).

checkAllSublists([], _ , _).
checkAllSublists([FirstList | RestOfLists], X, Sum) :-
	checkValidList(X, Sum, FirstList),
	checkAllSublists(RestOfLists, X, Sum).

checkCorrectSet(L, X) :-
	checkRange(L, X),
	allUnique(L).


%Trivial magic square
magic_square(1, [[1]]).

% no potential magic square
magic_square(2, _) :- !, fail.

%no potential magic square
magic_square(X, _):- X<1, !, fail.

%Logic rule checking whether a magic square of dimension NxN corresponds to matrix M
magic_square(N, M):-
	length(M, N),
	checkLengthOfEachList(M,N),
	get_square(N, Square),
	get_sum(Square, N, Sum),	
	checkAllSublists(M, Square, Sum),
	transpose(M, MTranspose),
	checkAllSublists(MTranspose, Square, Sum),
	flatten(M, Flattened),
	checkCorrectSet(Flattened, Square),
	diag_sum_easy(M, Sum),
	flipMatrixVertically(M, FlippedMatrix),
	diag_sum_easy(FlippedMatrix, Sum).
	

