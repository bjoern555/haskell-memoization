module Main where

import Criterion.Main
import Algorithms (fibSlow, fibFast, levSlow, levFast)

main :: IO ()
main = do
  let wort1 = "Informatiker"
  let wort2 = "Mathematiker"

  defaultMain 
    [ bgroup "1D: Fibonacci (n=30)" 
        [ bench "fibSlow (Standard)" $ whnf fibSlow 30
        , bench "fibFast (Memoized)" $ whnf fibFast 30
        ]
    , bgroup "2D: Levenshtein (12 Buchstaben)" 
        [ bench "levSlow (Standard)" $ whnf (levSlow wort1) wort2
        , bench "levFast (Memoized)" $ whnf (levFast wort1) wort2
        ]
    ]