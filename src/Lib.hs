module Lib where

import qualified Data.Vector as V

size = 7

findTopmostUnstable weights positions =
  let top = size - 1
      inner bottom =
        let weightBottom = weights V.! bottom
            posBottom = positions V.! bottom
            posTop = jointPosition weights positions (bottom + 1) top
            stable = areStable posTop posBottom weightBottom
        in if bottom > 0 && stable
           then inner (bottom - 1)
           else if stable
                then -1
                else bottom
  in inner (top - 1)

areStable positionTop positionBottom weightBottom =
  let leftBound = positionBottom - (weightBottom / 2)
      rightBound = positionBottom + (weightBottom / 2)
  in positionTop > leftBound && positionTop < rightBound

jointWeight weights bottom top =
  sum $ V.slice bottom (top - bottom + 1) weights

jointPosition weights positions bottom top =
  let totalWeight = jointWeight weights bottom top
      slicer = V.slice bottom (top - bottom + 1) 
      ws = slicer weights
      ps = slicer positions
      joint = sum $ V.zipWith (*) ws ps -- dot product.
  in joint / totalWeight :: Double
  
isStable weights positions = findTopmostUnstable weights positions < 0
