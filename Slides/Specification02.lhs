> module Slides.Specification02 where
> import Slides.Specification01
> import Data.Void

                             Specification, Cont...


We suppose that a given grid contains only digits and blanks. We also suppose
that the input grid is valid, meaning that no digit is reapeated in any row,
column, or box.

Now for the specification.

The aim is to write down the simplest and clearest specification of `solve`
without regard to how eficient the result might be. One possibility is first to
construct a list of all correctly completed grids, and then to test the given
grid against them to identify those whose non-blank entries match the given
ones. Another possibility, and the one we will adopt, is to start with the
givien grid and to install all possible choices for the blank entries. Then we
compute all teh grids that arise from making every possible choice and filter
the result for the valid ones. This specification is formalised by...

> solve :: Grid -> [ Grid ]
> solve = filter valid . expand . choices

The subsidiary functions have types...

> choices :: Grid           -> Matrix Choices
> expand  :: Matrix Choices -> [ Grid ]
> valid   :: Grid           -> Bool
>
> type Choices = Void
> choices = undefined
> expand  = undefined
> valid   = undefined
