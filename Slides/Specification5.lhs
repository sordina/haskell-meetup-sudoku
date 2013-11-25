> module Slides.Specification5 where
> import Slides.Specification

                             Specification, Cont...


Finally, we deal with `valid`. A valid grid is one in which now row, column, or
box contains duplicates:

> valid :: Grid -> Bool
> valid g = all nodups (rows g)
>        && all nodups (cols g)
>        && all nodups (boxs g)
>
> rows, cols, boxs :: Grid -> [ Grid ]
> rows = undefined
> cols = undefined
> boxs = undefined

The standard function `all p` applied to a finite list `xs` returns `True` if
all elements of `xs` satisfy the predicate `p` and `False` otherwise. The
function `nodups` can be defined by...

> nodups :: Eq a => [ a ] -> Bool
> nodups [ ]        = True
> nodups ( x : xs ) = all ( /= x ) xs && nodups xs

The function nodups takes quadratic time. As an alternative we couls sort the
list of digits and check that it is strictly increasing. Sorting can be done in
`Theta (n . log n)` steps. However, with n = 9 it is not clear that sorting the
digits is worthwhile. What would you prefer: 2.n^2 steps, or 100.n.log2(n)
steps?
