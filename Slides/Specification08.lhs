> module Slides.Specification08 where
> import Slides.Specification07

                             Specification, Cont...


The action boxes in the 4x4 case where group splits a list into groups of two,
is ilustrated by...

> prop_boxs :: Bool
> prop_boxs = boxs 2 [ "abcd"
>                    , "efgh"
>                    , "ijkl"
>                    , "mnop" ]
>                 == [ "abef"
>                    , "cdgh"
>                    , "ijmn"
>                    , "klop" ] -- prop_boxs: +++ OK, passed 1 tests.

The function `group . map group` produces a list of matrices; transposing each
matrix and ungrouping yields the boxes.

Observe that instead of thinking about matrices in terms of indeces, and doing
arithmetic on the indeces to identify the rows, columns, and boxes, we have gone
for definitions of these functions that trest the matrix as a complete entity in
itself. Geraint Jones has aptly called this style "wholemeal programming".
Wholemeal programming is good for you: it helps to prevent a disease called
indexitis and encourages lawful program construction.
