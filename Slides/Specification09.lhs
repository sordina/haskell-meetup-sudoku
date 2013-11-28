> {-# LANGUAGE ViewPatterns #-}
>
> module Slides.Specification09 where
> import Slides.Specification06
> import Slides.Specification07

                             Specification, Cont...


For example, here are three laws that are valid on 9x9 Sudoku grids, in fact, on
arbitrary N^2 x N^2 matrices:

> getMatrix _ = ["abcd","efgh","ijkl","mnop"]
>
> prop_rows_roundtrip (getMatrix -> m) = m == (rows   . rows) m
>     -- +++ OK, passed 100 tests.
>
> prop_cols_roundtrip (getMatrix -> m) = m == (cols   . cols) m
>     -- +++ OK, passed 100 tests.
>
> prop_boxs_roundtrip (getMatrix -> m) = m == (boxs n . boxs n) m
>   where n = length (head m) `div` 2
>     -- +++ OK, passed 100 tests.

Equivalently, all three functions are involutions. Two are easy to prove, but
one is more difficult. The difficult law is not the one about `boxs`, as you
might expect, but the involution property of `cols`. Though intuitively obvious,
proving it from the definition of cols is slightly tricky. The involution
property of `boxs` is an easy calculation using the involution property of
`cols`, simple properties of `map` and the fact that `group . ungroup = id`.
