module Isumi.Utils.Map
  ( foldableToMap
  , foldableToMapDiscardDupValues
  , foldableToMapWith
  )
where

import           Data.Foldable   (foldl')
import           Data.Map.Strict (Map)
import qualified Data.Map.Strict as Map
import           Data.Set        (Set)
import qualified Data.Set        as Set

foldableToMap :: (Foldable t, Ord k) => t (k, v) -> Map k [v]
foldableToMap = foldableToMapWith (: [])

foldableToMapDiscardDupValues
  :: (Foldable t, Ord k, Ord v) => t (k, v) -> Map k (Set v)
foldableToMapDiscardDupValues = foldableToMapWith Set.singleton

foldableToMapWith
  :: (Foldable t, Ord k, Monoid m) => (v -> m) -> t (k, v) -> Map k m
foldableToMapWith f = foldl' acc Map.empty
  where acc m (k, v) = Map.insertWith mappend k (f v) m

