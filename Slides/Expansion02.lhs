> module Slides.Expansion02 where
> import Slides.Specification01
> import Slides.Specification03

                         Single-Cell Expansion, Cont...


Think of a cell containing `cs` choices as sitting in the middle of a row `row`,
so `row == row1 ++ [cs] ++ row2`, in the matrix of choices, with rows `rows1`
above this row and rows `rows2` below it. Then we can define...

> expand1 :: Matrix Choices -> [ Matrix Choices ]
> expand1 rows = [rows1 ++ [row1 ++ [c] : row2] ++ rows2 | c <- cs]
>   where
>   (rows1, row : rows2) = break (any smallest) rows
>   (row1,  cs  : row2 ) = break smallest row
>   smallest cs'         = length cs' == n
>   n                    = minimum (counts rows)
>
> counts :: [[[a]]] -> [Int]
> counts = filter (/= 1) . map length . concat

The value `n` is the smallest number of choices, not equal to one, in any cell
of the matrix of choices. If the matrix of choices contains only singleton
choices, then n is the minimum of the empty list, which is not defined. The
standard function `break p` splits a list into two:

`break p xs = (takeWhile (not . p) xs, dropWhile (not . p) xs)`
