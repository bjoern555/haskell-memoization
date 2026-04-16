module Memo (memoFix) where

import Data.Function (fix)

memoize :: (Int -> a) -> (Int -> a)
memoize f = (map f [0..] !!)

memoFix :: ((Int -> a) -> (Int -> a)) -> (Int -> a)
memoFix f = fix (memoize . f)