> module Slides.Expansion01 where

                             Single-Cell Expansion


For more devious puzzles we can combine pruning with another idea: expanding the
choices for a single cell only. While `expand` installed all possible choices in
all cells on the grid in one go, single cell expansion picks on one cell and
installs all the choices for that cell only. The hope is that mixing `prune`s
with single-cell expansions can lead to a solution more quickly.

Therefore, we construct a function `expand1` that expands the choices for one
cell only. This function is required to satisfy the property that, up to some
permutation of the answer:

> prop_expand1 m = exmand m == (concat . map expand . expand1) m
