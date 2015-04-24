module Main where

import           Control.Monad
import           DirConcat
import           System.Directory
import           System.FilePath  ((</>))


filterHidden paths = return $ filter (\path -> head path /= '.') paths

isDir dir entry = doesDirectoryExist (dir </> entry)

getSubDirs dir = do
  content <- getDirectoryContents dir >>= filterHidden
  filterM (isDir dir) content

getFiles dir = do
  content <- getDirectoryContents dir >>= filterHidden
  filterM (fmap not . isDir dir) content

processSubDir :: String -> (String, String) -> IO [(String, String)]
processSubDir root (dir, number) = do
  files <- getFiles $ root </> dir
  let renames = map (\fn -> (root </> dir </> fn, root </> number ++ "_" ++ fn)) files
  return renames

processSubDirs :: String -> [(String, String)] -> IO ()
processSubDirs root pairs = do
  renames' <- mapM (processSubDir root) pairs
  let renames = concat renames'
  --print pairs
  --print renames
  mapM_ (uncurry renameFile) renames

main = do
  dir <- getCurrentDirectory
  dirs <-  getSubDirs dir
  let pairs = prepareSubDirs dirs
  maybe (return ()) (processSubDirs dir) pairs
