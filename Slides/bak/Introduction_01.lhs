> module Slides.Introduction_01 where

The game of Sudoku is played on a 9x9 board. A matrix is given consisting of
characters, such as:
                         c
                         o
                         l -----
                         s

                  rows   2  .  .    .  .  1    .  3  8
                   |     .  .  .    .  .  .    .  .  5
                   |     .  7  .    .  .  6    .  .  .

                         .  .  .    .  .  .    .  1  3
                         .  9  8    1  .  .    2  5  7
                         3  1  .    .  .  .    8  .  .

                         9  .  .    8  .  .    .  2  .
                         .  5  .    .  6  9    7  8  4
                         4  .  .    2  5  .    .  .  .

The idea is to fill in the dots with the digits 1-9 such that each row, column
and 3x3 sub-matrix "box", contains the digits 1-9 only once.
