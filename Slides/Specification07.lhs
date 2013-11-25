> module Slides.Specification07 where
> import Slides.Specification01
> import Slides.Specification06

                             Specification, Cont...


The function `boxs` is a little more interesting:

> boxs :: Int -> Matrix a -> Matrix a
> boxs n = map ungroup . ungroup . map cols . group n . map (group n)

The function group splits a list into groups of three:

> -- Could use `chunksOf` from Data.List.Split
> group :: Int -> [ a ] -> [[ a ]]
> group _ [ ] = [ ]
> group n xs  = take n xs : group n (drop n xs)

The function ungroup takes a grouped list and ungroups it:

> ungroup :: [[ a ]] -> [ a ]
> ungroup = concat
