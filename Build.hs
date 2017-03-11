import Development.Shake
import Development.Shake.Command
import Development.Shake.FilePath
import Development.Shake.Util
import System.Directory (createDirectoryIfMissing)
import Control.Monad (forM_)

uploadHost = "obraun@ob.cs.hm.edu"
uploadDir  = "www"

main :: IO ()
main = shakeArgs shakeOptions{shakeFiles=".shake/"} $ do
    want ["build"]

    phony "clean" $ do
        putNormal "Cleaning"
        liftIO $ removeFiles "_cache" ["//*"]
        liftIO $ removeFiles "_site" ["//*"]

    phony "build" $ do
        () <- cmd "stack build"
        cmd "stack exec site rebuild"

    phony "watch" $ do
        need ["build"]
        cmd "stack exec site watch"

    phony "push" $ do
        need ["build"]
        cmd "rsync -avz" "_site/" $ uploadHost ++ ":" ++ uploadDir

    phony "pullToOb" $ do
        cmd "ssh" $ uploadHost ++ " cd " ++ uploadDir
                    ++ " && git pull origin gh-pages"

