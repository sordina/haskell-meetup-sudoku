{-# LANGUAGE QuasiQuotes #-}

module Slides.Examples (example_puzzles, example_puzzles_hard, print_solutions)
where

import Text.InterpolatedString.Perl6 (q)
import Data.Char
import Data.List.Split

print_solutions :: [[[String]]] -> IO ()
print_solutions = mapM_ (mapM_ (\r -> putStrLn "" >> mapM_ putStrLn r))

example_puzzles :: [[String]]
example_puzzles = map example_puzzle
                $ splitOn "\n\n" examples

example_puzzles_hard :: [[String]]
example_puzzles_hard = map example_puzzle
                     $ splitOn "\n\n" examples_hard

example_puzzle :: String -> [String]
example_puzzle = filter (not . null)
               . filter (not . any isSpace)
               . map (filter (not . isSpace))
               . splitOn "\n"

examples :: String
examples = [q|
    170003800
    632001050
    040200000
    900500600
    564000291
    003006004
    000007020
    020300485
    006400019

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

examples_hard :: String
examples_hard = [q|
    046507000
    900000000
    000010452
    081000005
    500020007
    600000910
    752060000
    000000003
    000409270
  |]
