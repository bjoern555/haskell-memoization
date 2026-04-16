module Main where

import Criterion.Main
import Algorithms (fibSlow, fibFast, levSlow, levFast)

main :: IO ()
main = do
  let word1 = "Informatiker"
  let word2 = "Mathematiker"

  defaultMain 
    [ bgroup "1D: Fibonacci (n=30)" 
        [ bench "fibSlow (Standard)" $ whnf fibSlow 30
        , bench "fibFast (Memoized)" $ whnf fibFast 30
        ]
    , bgroup "2D: Levenshtein (12 letters)" 
        [ bench "levSlow (Standard)" $ whnf (levSlow word1) word2
        , bench "levFast (Memoized)" $ whnf (levFast word1) word2
        ]
    ]