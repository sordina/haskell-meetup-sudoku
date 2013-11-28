> module Slides.Pruning06 where
> import Slides.Specification01
> import Slides.Specification03
> import Slides.Specification04
> import Slides.Specification05 (nodups)
> import Slides.Specification06
> import Slides.Specification07
> import Slides.Pruning02

                     Pruning the matrix of choices, Cont...


We have shown that...

> prop_pruning_boxs :: Matrix Choices -> Bool
> prop_pruning_boxs m = (filter (all nodups . boxs 3) . expand) m
>                    == (filter (all nodups . boxs 3) . expand . pruneBy (boxs 3)) m

where

> pruneBy :: ([Row Choices] -> [Row Choices]) -> [Row Choices] -> [Row Choices]
> pruneBy f = f . map pruneRow . f

Repeating the same calculation for rows and cols, we obtain...

> prop_prune :: Matrix Choices -> Bool
> prop_prune m = (filter valid . expand) m == (filter valid . expand . prune) m

where...

> prune :: Matrix Choices -> Matrix Choices
> prune = pruneBy (boxs 3) . pruneBy cols . pruneBy rows

In conclusion, the previous definition of solve can be replaced with a new one:

> solve :: Grid -> [Grid]
> solve = filter valid . expand . prune . choices
