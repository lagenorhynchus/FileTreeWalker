module FileTreeWalker where

import System.Directory (doesDirectoryExist, getDirectoryContents)
import System.FilePath ((</>))
import qualified Data.Text.Lazy.IO as T
import qualified Data.Text.Lazy as T


walkFileTree :: FilePath -> (FilePath -> IO ()) -> IO ()
walkFileTree f proc = do
  isDirectory <- doesDirectoryExist f
  if isDirectory
    then do
      files <- getDirectoryContents f
      mapM_ ((`walkFileTree` proc) . (f </>)) $ filter (`notElem` [".", ".."]) files
    else proc f

main :: IO ()
main = walkFileTree "C:\\" $ T.putStrLn . T.pack
