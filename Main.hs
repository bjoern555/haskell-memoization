module Main where

import Criterion.Main
import Algorithms (fibSlow, fibFast)

main :: IO ()
main = defaultMain 
  [ bgroup "Fibonacci (n=35)" 
      [ bench "fibSlow (Standard Rekursion)" $ whnf fibSlow 35
      , bench "fibFast (Memoized Fixpoint)"  $ whnf fibFast 35
      ]
  ]