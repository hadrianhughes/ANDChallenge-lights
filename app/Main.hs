module Main where

import System.Environment

import Lib

main :: IO ()
main =
  do contents <- fileFromArgs =<< getArgs

     let output =
           case contents of
             Just c  -> c
             Nothing -> "File not found"

     putStrLn output
