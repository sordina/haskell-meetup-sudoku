> module Slides.Expansion03 where
> import Slides.Pruning02 (singleton)
> import Slides.Specification01 (Matrix)
> import Slides.Specification03 (Choices)
> import Slides.Specification05 (nodups)
> import Slides.Specification06
> import Slides.Specification07

                         Single-Cell Expansion, Cont...


Thus `break (any smallest) rows` breaks the matrix into two lists of rows with
the head of the second list being some row that contains a cell with the
smallest number of choices. A second appeal to `break` then breaks this row into
two sub-rows, with the head of the second being the element `cs` with the
smallest number of choiecs. Each possible choice is installed and the matrix
reconstructed. If there are zero choices, then `expand1` returns an empty list.

It follows from the definition of `n` that ( prop_expand1 ) holds only when
applied to matrices with at least one non-singleton choices. Say a matrix is
`complete` if all choices are singletons and `unsafe` if the singleton choices
is any row, column, or box contain duplicates. Incoplete and unsafe matrices can
never lead to valid grids. A complete and safe matrix of choices determines a
unique valid grid. These two tests can be implemented by...

> complete :: [[[a]]] -> Bool
> complete = all (all singleton)

> safe :: Matrix Choices -> Bool
> safe m = all ok (rows m) && all ok (cols m) && all ok (boxs 3 m)

where...

> ok :: Eq a => [[a]] -> Bool
> ok row = nodups [d | [d] <- row]
