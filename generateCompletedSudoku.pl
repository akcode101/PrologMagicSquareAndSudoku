
%checks length of a list of lists
checkLengthOfEachList([], _).
checkLengthOfEachList([H|T], SameNumber) :-
	length(H, SameNumber),
	checkLengthOfEachList(T, SameNumber).


%checks that a list is a permutation of numbers from 1-N using finite domain solver
fdcheckValidList(N, L):-
	fd_domain(L, 1, N),
	fd_all_different(L),
	fd_labeling(L).


map_matrix([[A1, A2, A3, A4, A5, A6, A7, A8, A9], 
			[B1, B2, B3, B4, B5, B6, B7, B8, B9], 
			[C1, C2, C3, C4, C5, C6, C7, C8, C9], 
			[D1, D2, D3, D4, D5, D6, D7, D8, D9], 
			[E1, E2, E3, E4, E5, E6, E7, E8, E9], 
			[F1, F2, F3, F4, F5, F6, F7, F8, F9], 
			[G1, G2, G3, G4, G5, G6, G7, G8, G9], 
			[H1, H2, H3, H4, H5, H6, H7, H8, H9], 
			[I1, I2, I3, I4, I5, I6, I7, I8, I9]], 
			A1, A2, A3, A4, A5, A6, A7, A8, A9, 
			B1, B2, B3, B4, B5, B6, B7, B8, B9, 
			C1, C2, C3, C4, C5, C6, C7, C8, C9, 
			D1, D2, D3, D4, D5, D6, D7, D8, D9, 
			E1, E2, E3, E4, E5, E6, E7, E8, E9, 
			F1, F2, F3, F4, F5, F6, F7, F8, F9, 
			G1, G2, G3, G4, G5, G6, G7, G8, G9,
			H1, H2, H3, H4, H5, H6, H7, H8, H9, 
			I1, I2, I3, I4, I5, I6, I7, I8, I9).							

%Logic rule checking whether M is a valid sudoku
sudoku(M) :-
	length(M, 9),
	checkLengthOfEachList(M,9),
	map_matrix(M, A1, A2, A3, A4, A5, A6, A7, A8, A9, 
				B1, B2, B3, B4, B5, B6, B7, B8, B9, 
				C1, C2, C3, C4, C5, C6, C7, C8, C9, 
				D1, D2, D3, D4, D5, D6, D7, D8, D9, 
				E1, E2, E3, E4, E5, E6, E7, E8, E9, 
				F1, F2, F3, F4, F5, F6, F7, F8, F9, 
				G1, G2, G3, G4, G5, G6, G7, G8, G9, 
				H1, H2, H3, H4, H5, H6, H7, H8, H9, 
				I1, I2, I3, I4, I5, I6, I7, I8, I9),

	fdcheckValidList(9, [A1, A2, A3, B1, B2, B3, C1, C2, C3]),
	fdcheckValidList(9, [D1, D2, D3, E1, E2, E3, F1, F2, F3]),
	fdcheckValidList(9, [G1, G2, G3, H1, H2, H3, I1, I2, I3]),
	fdcheckValidList(9, [A4, A5, A6, B4, B5, B6, C4, C5, C6]),
	fdcheckValidList(9, [D4, D5, D6, E4, E5, E6, F4, F5, F6]),
	fdcheckValidList(9, [G4, G5, G6, H4, H5, H6, I4, I5, I6]),
	fdcheckValidList(9, [A7, A8, A9, B7, B8, B9, C7, C8, C9]),
	fdcheckValidList(9, [D7, D8, D9, E7, E8, E9, F7, F8, F9]),
	fdcheckValidList(9, [G7, G8, G9, H7, H8, H9, I7, I8, I9]),


	
	fdcheckValidList(9, [A1, A2, A3, A4, A5, A6, A7, A8, A9]),
	fdcheckValidList(9, [B1, B2, B3, B4, B5, B6, B7, B8, B9]),
	fdcheckValidList(9, [C1, C2, C3, C4, C5, C6, C7, C8, C9]),
	fdcheckValidList(9, [D1, D2, D3, D4, D5, D6, D7, D8, D9]),
	fdcheckValidList(9, [E1, E2, E3, E4, E5, E6, E7, E8, E9]),
	fdcheckValidList(9, [F1, F2, F3, F4, F5, F6, F7, F8, F9]),
	fdcheckValidList(9, [G1, G2, G3, G4, G5, G6, G7, G8, G9]),
	fdcheckValidList(9, [H1, H2, H3, H4, H5, H6, H7, H8, H9]),
	fdcheckValidList(9, [I1, I2, I3, I4, I5, I6, I7, I8, I9]),
	
	
	fdcheckValidList(9, [A1, B1, C1, D1, E1, F1, G1, H1, I1]),
	fdcheckValidList(9, [A2, B2, C2, D2, E2, F2, G2, H2, I2]),
	fdcheckValidList(9, [A3, B3, C3, D3, E3, F3, G3, H3, I3]),
	fdcheckValidList(9, [A4, B4, C4, D4, E4, F4, G4, H4, I4]),
	fdcheckValidList(9, [A5, B5, C5, D5, E5, F5, G5, H5, I5]),
	fdcheckValidList(9, [A6, B6, C6, D6, E6, F6, G6, H6, I6]),
	fdcheckValidList(9, [A7, B7, C7, D7, E7, F7, G7, H7, I7]),
	fdcheckValidList(9, [A8, B8, C8, D8, E8, F8, G8, H8, I8]),
	fdcheckValidList(9, [A9, B9, C9, D9, E9, F9, G9, H9, I9]).

	
	

