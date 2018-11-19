{-# LANGUAGE OverloadedLists     #-}
{-# LANGUAGE ScopedTypeVariables #-}

module Isumi.Utils.MapSpec where

import           Test.Hspec

import           Isumi.Utils.Map

spec :: Spec
spec = do
  let xs :: [(Char, Int)] =
        [('a', 1), ('c', 1), ('b', 2), ('a', 3), ('c', 1)]
  describe "foldableToMap" $ do
    it "combines values of the same key" $
      foldableToMap xs `shouldBe` [('a', [3, 1]), ('b', [2]), ('c', [1, 1])]
    it "returns empty list for empty list" $
      foldableToMap ([] :: [(Char, Int)]) `shouldBe` []
  describe "foldableToMapDiscardDupValues" $ do
    it "combine values of the same key, discarding duplicate values" $
      foldableToMapDiscardDupValues xs `shouldBe`
        [('a', [3,1]), ('b', [2]), ('c', [1])]
    it "returns empty list for empty list" $
      foldableToMapDiscardDupValues ([] :: [(Char, Int)]) `shouldBe` []

