module DirConcat where

import           Data.Char

extractNumber :: String -> String
extractNumber str = extractNumberT str []
  where extractNumberT::String->String->String
        extractNumberT [] res = reverse res
        extractNumberT (x:xs) res
          | isDigit x
          = extractNumberT xs (x:res)
          | otherwise
          = extractNumberT xs res

prepareSubDirs :: [String] -> Maybe [(String,String)]
prepareSubDirs l = if allSame lengths then Just pairs else Nothing
  where
    genPair s = (s, extractNumber s)
    pairs = map genPair l
    lengths = map (\(_, n) -> length n) pairs
    allSame xs = all (== head xs) (tail xs)
