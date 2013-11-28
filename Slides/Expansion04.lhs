> module Slides.Expansion04 where
> import Slides.Specification01
> import Slides.Specification03
> import Slides.Specification04 (expand)
> import Slides.Specification07 (valid)
> import Slides.Pruning06       (prune)
> import Slides.Expansion02     (expand1)

                         Single-Cell Expansion, Cont...


Assuming a matrix is safe but incomplete, we can calculate:

filter valid . expand
= { since `expand = concat . map expand . expand1` on incomplete matrices}
filter valid . concat . map expand . expand1
= { since `filter p . concat = concat . map (filter p)` }
concat . map (filter valid . expand) . expand1
= { since `filter valid . expand = filter valid . expand . prune` }
concat . map (filter valid . expand . prune) . expand1

Intruducing...

> search :: Matrix Choices -> [Grid]
> search = filter valid . expand . prune

we therefore have, on safe but incomplete matrices, that...

> prop_search :: Matrix Choices -> Bool
> prop_search m = (search . prune) m
>              == (concat . map search . expand1) m

AND NOW......
