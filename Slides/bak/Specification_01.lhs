> module Slides.Specification_01 where
>
> import Data.List (transpose)
> import Slides.Introduction_02 (Board, Matrix)

The function "correct" tests if a filled board has different entries in each
row, column, and box:

> correct :: Board -> Bool
> correct b =  all nodups (rows b)
>           && all nodups (cols b)
>           && all nodups (boxs b)
>
> nodups :: Eq a => [a] -> Bool
> nodups []     = True
> nodups (x:xs) = notElem x xs && nodups xs
>
> rows, cols, boxs :: Matrix a -> Matrix a
> rows = id
> cols = transpose
> boxs = undefined
