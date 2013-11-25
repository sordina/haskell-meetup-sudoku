> module Slides.Specification3 where
> import Slides.Specification

                             Specification, Cont...


The simplest implementation of Choices is

> type Choices = [ Digit ]

Then we have...

> choices :: Grid -> Matrix Choices
> choices = map (map choice)
>
> choice :: Digit -> [ Digit ]
> choice d = if blank d then digits
>                       else [ d ]

If the cell is blank, then all digits are installed as possible choices;
otherwise there is no choice and a singleton is returned.
