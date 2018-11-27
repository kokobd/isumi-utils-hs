module Isumi.Utils.ListSpec
  ( spec
  ) where

import           Isumi.Utils.List (groupN)

import           TestPrelude

spec :: Spec
spec = do
  describe "groupN" $ do
    it "splits into sublists(of specified size) that can be concat back" $
      property $
        \(xs :: [Integer]) n -> n > 0 ==> let yss = groupN n xs
                  in (concat yss == xs) && all (\ys -> length ys <= n) yss
    it "works for a particular sample" $
      groupN 3 "aaabbbcc" == ["aaa", "bbb", "cc"]

