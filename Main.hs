module Main where

import Algorithms (fibSlow, fibFast)

main :: IO ()
main = do
    putStrLn "\nfibFast with 35 (with Cache)"
    print (fibFast 35)
    
    putStrLn "\nfibSlow with 35 (without Cache)"
    print (fibSlow 35)
