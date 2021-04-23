module Main where

import Lib

main :: IO ()
main = readFile "./data" >>= putStrLn
