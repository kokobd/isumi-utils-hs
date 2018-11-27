{-# LANGUAGE CPP #-}

import qualified Isumi.Utils.ListSpec as ListSpec
#ifdef HAS_CONTAINERS
import qualified Isumi.Utils.MapSpec  as MapSpec
#endif

import           TestPrelude

main :: IO ()
main = hspec spec

spec :: Spec
spec = do
  describe "Isumi.Utils.List" ListSpec.spec
#ifdef HAS_CONTAINERS
  describe "Isumi.Utils.Map" MapSpec.spec
#endif
