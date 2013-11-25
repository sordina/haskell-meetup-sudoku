> module Slides.Specification06 where
> import Slides.Specification01

                             Specification, Cont...


It remains to define `rows`, `columns`, and `boxs`. If a matrix is given by a
list of its rows, then `rows` is just the identity function on matrices:

> rows :: Matrix a -> Matrix a
> rows = id

The function `cols` computes the transpose of a matrix. One possible definition
is...

> -- Could use `transpose` from Data.List
> cols :: Matrix a -> Matrix a
> cols [ xs ]       = [[ x ] | x <- xs ]
> cols ( xs : xss ) = zipWith (:) xs (cols xss)
> cols _            = error "Specification doesn't deal with empty matrices..."
