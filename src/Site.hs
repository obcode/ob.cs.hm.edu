{-# LANGUAGE OverloadedStrings #-}
import           Data.List     (isPrefixOf)
import           Hakyll

main :: IO ()
main = hakyll $ do

    match "assets/**" $ do
        route   idRoute
        compile copyFileCompiler

    match "templates/*" $ compile templateCompiler

    match "lectures/*" $ do
        route   $ setExtension "html"
        compile $ pandocCompiler
            >>= loadAndApplyTemplate "templates/lecture.html" defaultContext'
            >>= loadAndApplyTemplate "templates/default.html" defaultContext'
            >>= relativizeUrls
            >>= dropboxifyUrls
--
--     match "bib/*" $ compile biblioCompiler
--
--     match "csl/*" $ compile cslCompiler
--
--     match "misc/*" $ do
--         route   $ setExtension "html"
--         compile $ bibtexCompiler
--               "csl/die-bachelorarbeit-samac-et-al-in-text.csl" "bib/ob.bib"
--             >>= loadAndApplyTemplate "templates/misc.html" defaultContext
--             >>= loadAndApplyTemplate "templates/default.html" defaultContext
--             >>= relativizeUrls
--
    match (fromList ["index.html","about.html","impressum.html"]) $ do
        route idRoute
        compile $ getResourceBody
            >>= loadAndApplyTemplate "templates/default.html" defaultContext'
            >>= relativizeUrls
--
--     match (fromList ["404.html"]) $ do
--         route idRoute
--         compile $ getResourceBody
--             >>= loadAndApplyTemplate "templates/default.html" defaultContext


bibtexCompiler :: String -> String -> Compiler (Item String)
bibtexCompiler cslFileName bibFileName = do
    csl <- load $ fromFilePath cslFileName
    bib <- load $ fromFilePath bibFileName
    fmap writePandoc
        (getResourceBody >>= readPandocBiblio defaultHakyllReaderOptions csl bib)

defaultContext' :: Context String
defaultContext' = mconcat
    [ dateField "date" "%Y"
    , defaultContext
    ]

dropboxifyUrls :: Item String -> Compiler (Item String)
dropboxifyUrls = return . fmap (withUrls addDropboxUrlPrefix)

addDropboxUrlPrefix :: String -> String
addDropboxUrlPrefix url
    | dropbox `isPrefixOf` url = dropboxlink ++ drop (length dropbox) url
    | otherwise = url
  where
    dropbox = "dropbox/"
    dropboxlink = "https://dl.dropboxusercontent.com/u/13563262/"
