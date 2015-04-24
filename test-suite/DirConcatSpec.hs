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

  describe "extractNumber" $ do
    it "returns empty string when no numbers" $
      extractNumber "Ep." `shouldBe` ""

    it "returns when them present" $
      extractNumber "Ep. 011" `shouldBe` "011"
