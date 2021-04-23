module Main where

import System.Environment

import InputOutput

main :: IO ()
main =
  do contents <- fileFromArgs =<< getArgs

     let intervals = parseFile <$> contents

     putStrLn "Finished."
