import Development.Shake
import Development.Shake.Command
import Development.Shake.FilePath
import Development.Shake.Util
import System.Directory (createDirectoryIfMissing)
import Control.Monad (forM_)

uploadHost = "ob.cs.hm.edu"
uploadDir  = "www"

main :: IO ()
main = shakeArgs shakeOptions{shakeFiles=".shake/"} $ do
    want ["build"]

    phony "clean" $ do
        putNormal "Cleaning"
        liftIO $ removeFiles "_cache" ["//*"]
        liftIO $ removeFiles "_site" ["//*"]
        liftIO $ removeFiles "." ["site", "site.hi", "site.o"]

    phony "build" $ do
        () <- cmd "ghc --make -threaded site.hs"
        cmd "./site rebuild"

    phony "watch" $ do
        need ["build"]
        cmd "./site watch"

    phony "push" $ do
        need ["build"]
        cmd "rsync -avz" "_site" $ uploadHost ++ ":" ++ uploadDir
