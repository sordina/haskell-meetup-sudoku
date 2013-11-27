> module Slides.Pruning03 where
> import Slides.Specification04

                     Pruning the matrix of choices, Cont...


We are now nearly ready for a calculation that will determine the function
`prune`. Nearly, but not quite, because we are going to need two laws about
`filter`. The first is that if `f . f = id`, then...

> prop_filter_id :: Eq a => (a -> Bool) -> (a -> a) -> [a] -> Bool
> prop_filter_id p f xs = filter (p . f) xs == (map f . filter p . map f) xs

Equivaliently, `filter (p . f) . map f = map f . filter p`. The second law is
that...

> prop_filter_cp :: Eq a => (a -> Bool) -> [[a]] -> Bool
> prop_filter_cp p xs = (filter (all p) . cp) xs == (cp . map (filter p)) xs

These proofs are left as exercises.
