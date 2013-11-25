> module Slides.Specification8 where
> import Slides.Specification7

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
