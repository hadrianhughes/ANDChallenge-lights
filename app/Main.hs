module Main where

import System.Environment
import Data.List

import InputOutput
import Types
import Lib


initialise :: IO [Interval]
initialise =
  do args <- getArgs
     contents <- fileFromArgs args

     case parseFile contents of
       Left (ParseError e) -> error e
       Right ivs           -> return ivs


main :: IO ()
main = (putStrLn . show . sumIntervals) <$> collapseIntervals =<< initialise
