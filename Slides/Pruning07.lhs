> module Slides.Pruning07 where

                     Pruning the matrix of choices, Cont...


In fact, rather than just one application of `prune`, we can have as many
`prune`s as we like. This is sensible, because after one round of pruning, some
choices may be resolved into singleton choices and another round of pruning may
remove still more impossible choices. The simplest Sudoku problems are solved
just by repeatedly pruning the matrix of choices until only singleton choiecs
are left.
