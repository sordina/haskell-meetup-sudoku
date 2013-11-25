> module Slides.Introduction_02 where

There may be one, none, or many solutions, although a good Sudoku puzzle will
have one unique solution exactly. We aim to derive a Haskell program to solve
Sudoku puzzles. Specifically, we will define a function

> type Matrix a = [[a]]
> type Board = Matrix Char
>
> sudoku :: Board -> [Board]
> sudoku = undefined

for computing all the ways a given board may be filled. If we only want one
solution we can take the head of the list, lazy-evaluation ensuring that only
one solution is computed.

Constants:

> boardsize, boxsize :: Int
> boardsize = 9
> boxsize   = 3
> cellvals  = "123456789"
> blank     = (== '.')
