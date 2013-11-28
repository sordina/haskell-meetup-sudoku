> module Slides.Specification01 where

                                 Specification


We begin wwith some basic data types, starting with matrices:

> type Matrix a = [ Row a ]
> type Row    a = [     a ]

An `M x N` matrix is a list of `M` rows in which each row has the same length `N`.

A grid is a 9x9 matrix of digits:

> type Grid  = Matrix Digit
> type Digit = Char


The valid digits are 1-9 with 0 standing for a blank:

> digits :: String
> digits = [ '1' .. '9' ]
>
> blank :: Digit -> Bool
> blank  = ( == '0' )
