module Lib where

import System.Directory

fileFromArgs :: [String] -> IO (Maybe String)
fileFromArgs [] = return Nothing
fileFromArgs (x:_) =
  do isFile <- doesFileExist x
     contents <- if isFile then readFile x else return ""

     return $
       if contents == ""
          then Nothing
          else Just contents
