> module Slides.Expansion01 where
> import Slides.Specification04
> import Slides.Specification01
> import Slides.Specification03

                             Single-Cell Expansion


For more devious puzzles we can combine pruning with another idea: expanding the
choices for a single cell only. While `expand` installed all possible choices in
all cells on the grid in one go, single cell expansion picks on one cell and
installs all the choices for that cell only. The hope is that mixing `prune`s
with single-cell expansions can lead to a solution more quickly.

Therefore, we construct a function `expand1` that expands the choices for one
cell only. This function is required to satisfy the property that, up to some
permutation of the answer:

> prop_expand1 :: Matrix Choices -> Bool
> prop_expand1 m = expand m == (concat . map expand . expand1) m
>
> expand1 :: Matrix Choices -> [ Matrix Choices ]
> expand1 = undefined

A good choices of cell on which to perform expansion is one with the smallest
number of choices (not equal to one, of course). A cell with no choices means
that the puzzle is unsolvable, so identifying such a cell quickly is a good
idea.
