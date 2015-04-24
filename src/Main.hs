module Main where

import           Control.Monad
import           System.Directory
import           System.FilePath  ((</>))


filterHidden paths = return $ filter (\path -> head path /= '.') paths

getSubDirs dir = do
  content <- getDirectoryContents dir >>= filterHidden
  filterM isDir content
  where
    isDir entry = doesDirectoryExist (dir </> entry)

main = do
  dir <- getCurrentDirectory
  dirs <-  getSubDirs dir
  putStrLn dir
  putStrLn "test"
  putStrLn $ show dirs
