{-# LANGUAGE OverloadedStrings #-}
import           Data.List     (isPrefixOf)
import           Hakyll

main :: IO ()
main = hakyll $ do
--     match "img/*" $ do
--         route   idRoute
--         compile copyFileCompiler
--
--     match "img/ico/*" $ do
--         route   idRoute
--         compile copyFileCompiler
--
    match "assets/css/*" $ do
        route   idRoute
        compile copyFileCompiler -- TODO: Compress and concat css
    match "assets/css/plugins/*" $ do
        route   idRoute
        compile copyFileCompiler -- TODO: Compress and concat css
--
--     match "fonts/*" $ do
--         route   idRoute
--         compile copyFileCompiler
--
    match "assets/js/*" $ do
        route   idRoute
        compile copyFileCompiler
    match "assets/js/plugins/*" $ do
        route   idRoute
        compile copyFileCompiler

    match "assets/icons/css/*" $ do
        route   idRoute
        compile copyFileCompiler
    match "assets/icons/fonts/*" $ do
        route   idRoute
        compile copyFileCompiler

    match "assets/img/*" $ do
        route   idRoute
        compile copyFileCompiler
    match "assets/img/small/*" $ do
        route   idRoute
        compile copyFileCompiler

    match "assets/cubeportfolio/css/*" $ do
        route   idRoute
        compile copyFileCompiler
    match "assets/cubeportfolio/img/*" $ do
        route   idRoute
        compile copyFileCompiler
    match "assets/cubeportfolio/js/*" $ do
        route   idRoute
        compile copyFileCompiler

    match "lectures/*" $ do
        route   $ setExtension "html"
        compile $ pandocCompiler
            >>= loadAndApplyTemplate "templates/lecture.html" defaultContext
            >>= loadAndApplyTemplate "templates/default.html" defaultContext
            >>= relativizeUrls
-- --            >>= dropboxifyUrls
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
    match "index.html" $ do -- (fromList ["index.html","about.html","impressum.html"]) $ do
        route idRoute
        compile $ getResourceBody
            >>= loadAndApplyTemplate "templates/default.html" defaultContext
            >>= relativizeUrls
--
--     match (fromList ["404.html"]) $ do
--         route idRoute
--         compile $ getResourceBody
--             >>= loadAndApplyTemplate "templates/default.html" defaultContext

    match "templates/*" $ compile templateCompiler

bibtexCompiler :: String -> String -> Compiler (Item String)
bibtexCompiler cslFileName bibFileName = do
    csl <- load $ fromFilePath cslFileName
    bib <- load $ fromFilePath bibFileName
    fmap writePandoc
        (getResourceBody >>= readPandocBiblio defaultHakyllReaderOptions csl bib)

dropboxifyUrls :: Item String -> Compiler (Item String)
dropboxifyUrls = return . fmap (withUrls addDropboxUrlPrefix)

addDropboxUrlPrefix :: String -> String
addDropboxUrlPrefix url
    | dropbox `isPrefixOf` url = dropboxlink ++ drop (length dropbox) url
    | otherwise = url
  where
    dropbox = "dropbox"
    dropboxlink = "/dropbox/lectures"
