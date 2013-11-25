> module Slides.Specification4 where
> import Slides.Specification
> import Slides.Specification3

                             Specification, Cont...


Next, expansion is just matrix Cartesian product:

> expand :: Matrix Choices -> [ Grid ]
> expand = cp . map cp

The Cartesian product of a list-of-lists is given by...

> cp :: [[ a ]] -> [[ a ]]
> cp []         = [[ ]]
> cp (xs : xss) = [ x : ys | x <- xs, ys <- cp xss ]

For example...

> prop_cp :: Bool
> prop_cp = cp [[ 1,2 ], [ 3 ], [ 4,5 :: Int ]]
>        ==    [[ 1,3,4 ], [ 1,3,5 ], [ 2,3,4 ], [ 2,3,5 ]]

... prop_cp: +++ OK, passed 1 tests -- QuickCheck

Thus, `map cp` returns a list of all possible choices for each row
and `cp . map cp` installs each choice for the rows in all possible ways.
