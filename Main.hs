module Main where

import Criterion.Main
import Algorithms (fibSlow, fibFast, levSlow, levFast, knapSlow, knapFast)

main :: IO ()
main = do
  let items = [(10,2), (20,3), (30,5), (40,7), (50,9), (15,2), (25,4), (35,6), (45,8), (55,10),
               (12,2), (22,3), (32,5), (42,7), (52,9), (17,2), (27,4), (37,6), (47,8), (57,10)]
  let cap = 50

  defaultMain 
    [ bgroup "1D: Fibonacci (n=30)" 
        [ bench "fibSlow" $ whnf fibSlow 30
        , bench "fibFast" $ whnf fibFast 30 ]
    , bgroup "2D: Levenshtein" 
        [ bench "levSlow" $ whnf (levSlow "Informatiker") "Mathematiker"
        , bench "levFast" $ whnf (levFast "Informatiker") "Mathematiker" ]
    , bgroup "2D: Knapsack (20 Items)" 
        [ bench "knapSlow" $ whnf (knapSlow items) cap
        , bench "knapFast" $ whnf (knapFast items) cap ]
    ]