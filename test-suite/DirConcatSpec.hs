module DirConcatSpec (spec) where

import           DirConcat
import           Test.Hspec
import           Test.Hspec.QuickCheck

spec :: Spec
spec = do
  describe "tst" $ do
    it "returns the unit value" $
      tst `shouldBe` ()

    prop "equals the unit value" $
       \ x -> tst == x
