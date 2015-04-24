module DirConcatSpec (spec) where

import           DirConcat
import           Test.Hspec
import           Test.Hspec.QuickCheck

spec :: Spec
spec = do
  describe "extractNumber" $ do
    it "returns empty string when no numbers" $
      extractNumber "Ep." `shouldBe` ""

    it "returns when them present" $
      extractNumber "Ep. 011" `shouldBe` "011"

  describe "prepareSubDirs" $ do
    it "returns pair (string, numbers)" $
      prepareSubDirs ["ep1", "ep2", "ep3"] `shouldBe`
        Just [("ep1", "1"), ("ep2", "2"), ("ep3", "3")]

    it "returns Nothing is lengths of numbers differs" $
      prepareSubDirs ["ep1", "ep20", "ep3"] `shouldBe` Nothing
