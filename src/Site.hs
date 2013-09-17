{-# LANGUAGE OverloadedStrings #-}

module Site
  ( app
  ) where

import           Control.Monad.Trans (liftIO)
import           Data.ByteString (ByteString)
import           Data.Configurator
import           Snap.Snaplet
import           Snap.Snaplet.Heist
import           Snap.Snaplet.Session.Backends.CookieSession
import           Snap.Util.FileServe
import           Application
import           Eval

routes :: [String] -> [(ByteString, Handler App App ())]
routes eval =
         [ ("",                 heistServe)
         , ("/img",             serveDirectory "static/img")
         , ("/css",             serveDirectory "static/css")
         , ("/js",              serveDirectory "static/js")
         , ("/fonts",           serveDirectory "static/fonts")
         , ("/docs",            serveDirectory "static/docs")
         , ("/eval/:lecture",   evalHandler eval)
         ]


app :: SnapletInit App App
app = makeSnaplet "app" "The ob.cs.hm.edu website." Nothing $ do
    conf <- getSnapletUserConfig
    eval <- fmap read $ liftIO $ lookupDefault "[]" conf "evaluation"
    h <- nestSnaplet "" heist $ heistInit "templates"
    s <- nestSnaplet "sess" sess $
           initCookieSessionManager "site_key.txt" "sess" (Just 3600)

    addRoutes $ routes eval
    return $ App h s

