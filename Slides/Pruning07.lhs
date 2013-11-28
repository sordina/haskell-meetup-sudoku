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
just by repeatedly pruning the matrix of choices until only singleton choiecs
are left.

...

For example:

> main :: IO ()
> main = mapM_ (mapM_ (\r -> putStrLn "" >> mapM_ putStrLn r) . solve_fix) problems
>
> problems :: [Grid]
> problems = example_puzzles
>
> solve_fix :: Grid -> [Grid]
> solve_fix = filter valid . expand . fix prune . choices
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
