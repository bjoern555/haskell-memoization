module Algorithms (fibSlow, fibFast, levSlow, levFast) where

import Data.Function (fix)
import Memo (memoFix, memoFix2)

fibF :: (Int -> Integer) -> Int -> Integer
fibF _ 0 = 0
fibF _ 1 = 1
fibF rec n = rec (n - 1) + rec (n - 2)

fibSlow :: Int -> Integer
fibSlow = fix fibF

fibFast :: Int -> Integer
fibFast = memoFix fibF

levenshteinF :: String -> String -> (Int -> Int -> Int) -> Int -> Int -> Int
levenshteinF s1 s2 rec i j
  | i == 0 = j
  | j == 0 = i
  | s1 !! (i - 1) == s2 !! (j - 1) = rec (i - 1) (j - 1)
  | otherwise = 1 + minimum 
      [ rec (i - 1) j
      , rec i (j - 1)
      , rec (i - 1) (j - 1)
      ]

levSlow :: String -> String -> Int
levSlow s1 s2 = fix (levenshteinF s1 s2) (length s1) (length s2)

levFast :: String -> String -> Int
levFast s1 s2 = memoFix2 (levenshteinF s1 s2) (length s1) (length s2)