> module Slides.Pruning02 where
> import Slides.Specification01
> import Slides.Specification03
> import Slides.Specification04
> import Slides.Specification05
> import Data.List ((\\))

                     Pruning the matrix of choices, Cont...


How can we define `prune`? Well, since a matrix is a list of rows, a good place
to start is by pruning a single row. The function `pruneRow` is defined by...

> pruneRow :: Row Choices -> Row Choices
> pruneRow row = map (remove fixed) row where fixed = [ d | [ d ] <- row ]

The function `remove` removes choices from any choice that is not fixed:

> remove :: Eq a => [ a ] -> [ a ] -> [ a ]
> remove xs ds = if singleton ds then ds
>                                else ds \\ xs
> singleton :: [ a ] -> Bool
> singleton [ _ ] = True
> singleton   _   = False

The function pruneRow satisfies...

> prop_pruneRow :: Grid -> Bool
> prop_pruneRow row = (filter nodups . cp) row
>                  == (filter nodups . cp . pruneRow) row

The proof is left as an exercise...
