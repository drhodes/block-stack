module Main where

import qualified Data.Vector as V
import Lib

main = do
  let f ws ps = print ("Is Stable?: ", isStable ws ps)
  
  let stableWeights = V.fromList [9,9,5,7,7,5,3]
  let stablePositions = V.fromList [0,-1,-3,-3,-5,-7,-9]
  f stableWeights stablePositions
  
  let unstableWeights = V.fromList [9, 9, 5, 7, 7, 5, 3]
  let unstablePositions = V.fromList [0, -1, -7, -3, -5, -7, -9]
  f unstableWeights unstablePositions
