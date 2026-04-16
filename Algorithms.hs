module Algorithms where

import Data.Function (fix)
import Memo (memoFix)

fibF :: (Int -> Integer) -> Int -> Integer
fibF _ 0 = 0
fibF _ 1 = 1
fibF rec n = rec (n - 1) + rec (n - 2)

fibSlow :: Int -> Integer
fibSlow = fix fibF

fibFast :: Int -> Integer
fibFast = memoFix fibF