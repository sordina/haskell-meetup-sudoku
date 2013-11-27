> module Slides.Pruning03 where
> import Slides.Specification01
> import Slides.Specification03
> import Slides.Specification04
> import Slides.Specification05 hiding (rows, cols, boxs)
> import Slides.Specification06
> import Slides.Specification07

                     Pruning the matrix of choices, Cont...


Now for the calculation. The starting point is to rewrite

  `filter valid .  expand`:

> prop_rewrite_expand :: Matrix Choices -> Bool
> prop_rewrite_expand m = ( filter valid . expand    ) m
>                      == ( filter (all nodups . boxs 3)
>                         . filter (all nodups . cols)
>                         . filter (all nodups . rows) . expand) m
