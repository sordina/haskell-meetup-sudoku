{-# LANGUAGE QuasiQuotes #-}

module Slides.Examples (example_puzzles)
where

import Text.InterpolatedString.Perl6 (q)
import Data.Char
import Data.List.Split

example_puzzles :: [[String]]
example_puzzles = map example_puzzle
                $ splitOn "\n\n" examples

example_puzzle :: String -> [String]
example_puzzle = filter (not . null)
               . filter (not . any isSpace)
               . map (filter (not . isSpace))
               . splitOn "\n"

examples :: String
examples = [q|
    069034007
    000016000
    090001064
    206090508
    410300070
    020700890
    000620000
    900150240

    401279305
    200145009
    070060020
    105000908
    380000041
    700010003
    000050000
    043927510
    007681400
  |]
