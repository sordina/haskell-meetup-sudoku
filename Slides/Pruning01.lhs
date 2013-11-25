> module Slides.Pruning01 where
> import Slides.Specification01
> import Slides.Specification03
> import Slides.Specification04
> import Slides.Specification05

                         Pruning the matrix of choices

Though executable in theory, the specification of `solve` is hopeless in
practice. Assuming about a half of the 81 entries are fixed initially (a
generous estimate), there are about 9^40, or...

  147 808 829 414 345 923 316 083 210 206 383 297 601

grids to check!  How was this number determined?

... A grid is 9x9 cells = 81 cells
... Half of these are expected to be empty =~ 40 cells
... Performing simple multiplication of choices = 9^40 choices
... 9^40 = 147808829414345923316083210206383297601

We therefore need a better approach. To make a more efficient solver, a good
idea is to remove any choices from a cell c that already occur as singeleton
entries in the row, column, and box containing c. A singleton entry corresponds
to a fixed choice. We therefore seek a function...

> prune :: Matrix Choices -> Matrix Choices
> prune = undefined

such that...

> prop_prune :: Matrix Choices -> Bool
> prop_prune m = (filter valid . expand) m == (filter valid . expand . prune) m
