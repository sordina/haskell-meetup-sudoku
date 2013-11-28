> {-# LANGUAGE ViewPatterns #-}
>
> module Slides.Specification10 where
> import Slides.Specification01
> import Slides.Specification03
> import Slides.Specification04
> import Slides.Specification06
> import Slides.Specification07

                             Specification, Cont...


Here are three more laws, valid on N^2 x N^2 matrices of choices:

> getMatrix :: Matrix Choices -> Matrix Choices
> getMatrix _ = choices ["0123","9521","1243","3012"]
>
> prop_rows_expand :: Matrix Choices -> Bool
> prop_rows_expand (getMatrix -> m) = (map rows . expand) m == (expand . rows) m
> --  +++ OK, passed 100 tests.
>
> prop_cols_expand :: Matrix Choices -> Bool
> prop_cols_expand (getMatrix -> m) = (map cols . expand) m == (expand . cols) m
> --  +++ OK, passed 100 tests.
>
> prop_boxs_expand :: Matrix Choices -> Bool
> prop_boxs_expand (getMatrix -> m) = (map (boxs 2) . expand) m == (expand . boxs 2) m
> --  +++ OK, passed 100 tests.

We will make use of these laws in a short while.
