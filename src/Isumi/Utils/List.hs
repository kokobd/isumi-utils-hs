module Isumi.Utils.List
  ( groupN
  ) where

groupN :: Int -> [a] -> [[a]]
groupN n [] = if n < 0 then repeat [] else []
groupN n xs =
  let (y, ys') = splitAt n xs
   in y : groupN n ys'

