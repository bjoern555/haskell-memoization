module Memo (memoFix, memoFix2) where

import Data.Function (fix)

--1D Memoization
memoize :: (Int -> a) -> (Int -> a)
memoize f = (map f [0..] !!)

memoFix :: ((Int -> a) -> (Int -> a)) -> (Int -> a)
memoFix f = fix (memoize . f)

--2D Memoization
memoize2 :: (Int -> Int -> a) -> (Int -> Int -> a)
memoize2 f = \x y -> cache !! x !! y
  where
    cache = map (\x' -> map (\y' -> f x' y') [0..]) [0..]

memoFix2 :: ((Int -> Int -> a) -> (Int -> Int -> a)) -> (Int -> Int -> a)
memoFix2 f = fix (\rec -> memoize2 (f rec))