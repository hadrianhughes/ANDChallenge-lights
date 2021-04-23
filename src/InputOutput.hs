module InputOutput where

import System.Directory
import Text.Regex

import Types


fileFromArgs :: [String] -> IO (Maybe String)
fileFromArgs [] = return Nothing
fileFromArgs (x:_) =
  do isFile <- doesFileExist x
     contents <- if isFile then readFile x else return ""

     return $
       if contents == ""
          then Nothing
          else Just contents


intervalFromString :: String -> Either ParseError Interval
intervalFromString s =
  case matchRegex pttrn s of
    Just [a,b] -> Right (Interval (read a) (read b))
    Nothing    -> Left (ParseError $ s <> " is not a valid interval.")
  where
    pttrn = mkRegex "^\\[(\\d+), ?(\\d+)\\]$"


parseFile :: String -> Either ParseError [Interval]
parseFile f = traverse intervalFromString $ lines f
