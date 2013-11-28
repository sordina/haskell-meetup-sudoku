> module Slides.Pruning07 where
> import Slides.Specification01
> import Slides.Specification03
> import Slides.Specification04
> import Slides.Specification07
> import Slides.Pruning06
> import Slides.Examples
> import Data.List (find)
> import Data.Maybe (fromJust)

                     Pruning the matrix of choices, Cont...


In fact, rather than just one application of `prune`, we can have as many
`prune`s as we like. This is sensible, because after one round of pruning, some
choices may be resolved into singleton choices and another round of pruning may
remove still more impossible choices. The simplest Sudoku problems are solved
just by repeatedly pruning the matrix of choices until pruning has no effect.

For example:

> solve_fix :: Grid -> [Grid]
> solve_fix = filter valid . expand . fix prune . choices
>
> main :: IO ()
> main = print_solutions (map solve_fix example_puzzles)
>
> -- Equality based fix-point finder
> fix :: Eq d => (d -> d) -> d -> d
> fix f d = fst $ fromJust $ find (uncurry (==)) $ zip x (tail x)
>   where x = (iterate f d)


                                                           .:.
                                                       .:. \|/  .:.
                          _               \\,///       \|/  |   \|/
                        _/_\_   ___       \\|///    <#> |  \|<#> |
                         (")   /.-.\       (")\\       \|<#>|/  \| /
               _        //U\\  |(")|      //-\\\        |  \| /<#>/
              ( )   _   \|_|/  /)v(\  <#>_/|_|/\\     \ |/  |/  \|
             (_` )_('>   | |   \/~\/       |||\\\      \|   |    |/
             (__,~_)8    |||   //_\\       ||| \\       |/ \| / \| /
       jgs      _YY_    _[|]_ /_____\     _[|]_        \|   |/   |/
"""""""""""""""""'""'""'"""""'""""'""'"""'"""""''"'"""^^^^^^^^^^^^^^^^^^^^^^^^


Woooooooooooo! We solved sudoku!!!!

... Not completely, but it's a start!
