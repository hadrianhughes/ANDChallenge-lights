module Lib where

import Data.List
import Types


collapseIntervals :: [Interval] -> [Interval]
collapseIntervals ivs = foldl insertInterval [] sorted
  where
    sorted = sort ivs


insertInterval :: [Interval] -> Interval -> [Interval]
insertInterval [] i = [i]
insertInterval ivs i =
  if intervalsOverlap (last ivs) i
     then init ivs ++ [(Interval (min aStart bStart) (max aEnd bEnd))]
     else ivs ++ [i]
  where
    (Interval aStart aEnd) = last ivs
    (Interval bStart bEnd) = i


intervalsOverlap :: Interval -> Interval -> Bool
intervalsOverlap (Interval aStart aEnd) (Interval bStart bEnd) = contained || atEnds
  where
    contained = (aStart > bStart && aEnd < bEnd) || (bStart > aStart && bEnd < aEnd)
    atEnds    = (aStart < bStart && aEnd > bStart) || (bStart < aStart && bEnd > aStart)
