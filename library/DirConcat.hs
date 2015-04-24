module DirConcat where

import Data.Char

tst :: () -- ^ The unit type.
tst = ()

extractNumber:: String -> String
extractNumber str = extractNumberT str []
  where extractNumberT::String->String->String
        extractNumberT [] res = reverse res
        extractNumberT (x:xs) res
          | isDigit x
          = extractNumberT xs (x:res)
          | otherwise
          = extractNumberT xs res
