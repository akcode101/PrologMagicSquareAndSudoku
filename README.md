# PrologMagicSquareAndSudoku
Prolog functions to generate magic squares and fill out/generate a sudoku board. In this Prolog, to test out my functionality, I used "Gprolog" or GNU Prolog, a compiler for Prolog
developed by Daniel Diaz.

To run the code, after cloning this repository, enter the command "gprolog". After this, enter the commands "[magicSquare.pl]" and "[generateCompletedSudoku.pl]" to load the code
from these two files.

##Magic Square
To generate a magic square of size N, enter the command "magic_square(N, M)". Prolog, using its search, will attempt to find a magic square that is NxN in matrix M. To speed up
the process, you can label parts of the matrix in M to narrow down the search space.

##Sudoku
There are 9! × 722 × 27 × 27,704,267,971 valid sudoku. As a result, I realized that generating a valid sudoku would take very long. Thus, while testing this command using "sudoku M"
, one thing to remember is to fill out most of the sudoku board, as this Prolog program may lack some speed at completing the sudoku. However, given enough time, the solution
should be reached.

