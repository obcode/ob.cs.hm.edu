{-# LANGUAGE OverloadedStrings #-}

module Site
  ( app
  ) where

import           Control.Monad.Trans (liftIO)
import           Data.ByteString (ByteString)
import           Data.Configurator as Conf
import           Snap.Snaplet
import           Snap.Snaplet.Auth
import           Snap.Snaplet.Auth.Backends.JsonFile
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
    eval <- fmap read $ liftIO $ lookupDefault [] conf "evaluation"
    h <- nestSnaplet "" heist $ heistInit "templates"
    s <- nestSnaplet "sess" sess $
           initCookieSessionManager "site_key.txt" "sess" (Just 3600)

    -- NOTE: We're using initJsonFileAuthManager here because it's easy and
    -- doesn't require any kind of database server to run.  In practice,
    -- you'll probably want to change this to a more robust auth backend.
    a <- nestSnaplet "auth" auth $
           initJsonFileAuthManager defAuthSettings sess "users.json"
    addRoutes $ routes eval
    addAuthSplices auth
    return $ App h s a

