module Types where

data ParseError = ParseError String

data Interval = Interval Integer Integer deriving (Show)
