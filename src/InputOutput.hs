module InputOutput where

import System.Directory
import Text.Regex

import Types


fileFromArgs :: [String] -> IO String
fileFromArgs [] = error "No file given."
fileFromArgs (x:_) =
  do exists <- doesFileExist x
     if exists
        then readFile x
        else error ("File " <> x <> " not found.")


intervalFromString :: String -> Either ParseError Interval
intervalFromString s =
  case matchRegex pttrn s of
    Just [a,b] -> Right (Interval (read a) (read b))
    Nothing    -> Left (ParseError $ s <> " is not a valid interval.")
  where
    pttrn = mkRegex "\\[([0-9]+), ?([0-9]+)\\]"


parseFile :: String -> Either ParseError [Interval]
parseFile f = traverse intervalFromString $ lines f
