module Algorithms (fibSlow, fibFast, levSlow, levFast, knapSlow, knapFast) where

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

type Item = (Int, Int)

knapsackF :: [Item] -> (Int -> Int -> Int) -> Int -> Int -> Int
knapsackF items rec i w
  | i == 0 || w == 0 = 0
  | weight > w       = rec (i - 1) w
  | otherwise        = max (rec (i - 1) w) (val + rec (i - 1) (w - weight))
  where
    (val, weight) = items !! (i - 1)

knapSlow :: [Item] -> Int -> Int
knapSlow items cap = fix (knapsackF items) (length items) cap

knapFast :: [Item] -> Int -> Int
knapFast items cap = memoFix2 (knapsackF items) (length items) cap