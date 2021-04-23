module Types where

import Control.Exception


data ParseError = ParseError String deriving (Show)

instance Exception ParseError

data Interval = Interval Integer Integer deriving (Show, Ord, Eq)
