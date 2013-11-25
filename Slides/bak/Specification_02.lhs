> module Slides.Specification_02 where
>
> import Data.List.Split (chunksOf)
> import Slides.Introduction_02 (Matrix)
> import Slides.Specification_01 (cols)

> boxsize :: Int
> boxsize = 3

> boxs :: Matrix a -> Matrix a
> boxs = map ungroup . ungroup . map cols . group . map group

> group :: [a] -> [[a]]
> group = chunksOf boxsize
>
> ungroup :: [[a]] -> [a]
> ungroup = concat
