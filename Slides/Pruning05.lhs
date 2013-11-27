> module Slides.Pruning05 where

                     Pruning the matrix of choices, Cont...


The order in which the filters appear on the right is not important. The plan of
attack is to send each of these filters into battle with `expand`. For example,
in the `boxs` case we argue:

filter (all nodups . boxs) . expand
= { since boxs . boxs = id }
map boxs . filter (all nodups) . map boxs . expand
= { prop_boxs_expand }
map boxs . filter (all nodups) . expand . boxs
= { definition of expand }
map boxs . filter (all nodups) . cp . map cp . boxs
= { prop_filter_cp, and (map f . map g = map (f . g) }
map boxs . cp . map (filter nodups . cp) . boxs
= { prop_pruneRow }
map boxs . cp . map (filter nodups . cp . pruneRow) . boxs
= { prop_filter_cp }
map boxs . filter (all nodups) . cp . map cp . map pruneRow . boxs
= { definition of expand }
map boxs . filter (all nodups) . expand . map pruneRow . boxs
= { prop_filter_id in the form map f . filter p = filter (p . f) . map f}
filter (all nodups . boxs) . map boxs . expand . map pruneRow . boxs
= { prop_boxs_expand }
filter (all nodups . boxs) . expand . boxs . map pruneRow . boxs

