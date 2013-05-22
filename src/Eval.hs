{-# LANGUAGE OverloadedStrings #-}

module Eval
  ( evalHandler
  ) where

import           Application
import           Control.Applicative   ((<$>), (<*>))
import           Control.Monad.Trans   (liftIO)
import qualified Data.ByteString.Char8 as B
import           Data.List             (intercalate)
import           Data.Text             (append, pack, Text)
import qualified Data.Text.IO as T
import           Data.Time             (getCurrentTime)
import           Heist.Interpreted
import           Lectures
import           Snap.Core
import           Snap.Snaplet
import           Snap.Snaplet.Heist
import           Text.Digestive
import           Text.Digestive.Heist
import           Text.Digestive.Snap

data YesNo = No | Yes
    deriving (Show, Eq)

data Eval = Eval
    { question1   :: Maybe Int
    , question2   :: Maybe Int
    , question3   :: Maybe Int
    , question4   :: Maybe Int
    , question5   :: Maybe Int
    , question6   :: Maybe Int
    , question7   :: Maybe Int
    , question8   :: Maybe Int
    , question9   :: Maybe Int
    , question10  :: Maybe Int
    , question11  :: Maybe Int
    , question12  :: Maybe Int
    , question13  :: Maybe Int
    , question14  :: Maybe Int
    , question15  :: Maybe Int
    , question16  :: Maybe Int
    , question17  :: Text
    , question18  :: Text
    , question19  :: Maybe Int
    , question20  :: Maybe Int
    , question21  :: Maybe Int
    , question22  :: Maybe Int
    , question23  :: Maybe Bool
    , question24  :: Maybe Bool
    , question25a :: Bool
    , question25b :: Bool
    , question25c :: Bool
    , question26  :: Maybe Bool
    , question27  :: Text
    , question28  :: Text
    , question29  :: Text
    , question30  :: Text
    , question31  :: Text
    , question32  :: Text
    }
    deriving (Show)

evalForm :: Monad m => Form Text m Eval
evalForm = Eval
    <$> "question1"   .: choice choiceList Nothing
    <*> "question2"   .: choice choiceList Nothing
    <*> "question3"   .: choice choiceList Nothing
    <*> "question4"   .: choice choiceList Nothing
    <*> "question5"   .: choice choiceList Nothing
    <*> "question6"   .: choice choiceList Nothing
    <*> "question7"   .: choice choiceList Nothing
    <*> "question8"   .: choice choiceList Nothing
    <*> "question9"   .: choice choiceList Nothing
    <*> "question10"  .: choice choiceList Nothing
    <*> "question11"  .: choice choiceList Nothing
    <*> "question12"  .: choice choiceList Nothing
    <*> "question13"  .: choice choiceList Nothing
    <*> "question14"  .: choice choiceList Nothing
    <*> "question15"  .: choice choiceList Nothing
    <*> "question16"  .: choice choiceList Nothing
    <*> "question17"  .: text Nothing
    <*> "question18"  .: text Nothing
    <*> "question19"  .: choice procentList Nothing
    <*> "question20"  .: choice procentList Nothing
    <*> "question21"  .: choice procentList Nothing
    <*> "question22"  .: choice procentList Nothing
    <*> "question23"  .: choice yesnoList Nothing
    <*> "question24"  .: choice yesnoList Nothing
    <*> "question25a" .: bool Nothing
    <*> "question25b" .: bool Nothing
    <*> "question25c" .: bool Nothing
    <*> "question26"  .: choice yesnoList Nothing
    <*> "question27"  .: text Nothing
    <*> "question28"  .: text Nothing
    <*> "question29"  .: text Nothing
    <*> "question30"  .: text Nothing
    <*> "question31"  .: text Nothing
    <*> "question32"  .: text Nothing
  where
    choiceList = [ (Nothing, "Nicht gewählt")
                 , (Just 1,  "(1) genau")
                 , (Just 2,  "(2)")
                 , (Just 3,  "(3)")
                 , (Just 4,  "(4)")
                 , (Just 5,  "(5) überhaupt nicht")
                 , (Just 0,  "(0) ?")
                 ]
    procentList = [ (Nothing, "Nicht gewählt")
                  , (Just 76, "76-100%")
                  , (Just 51, "51-75%")
                  , (Just 26, "26-50%")
                  , (Just 0,  "0-25%")
                  ]
    yesnoList = [ (Nothing,    "Nicht gewählt")
                , (Just True,  "ja")
                , (Just False, "nein")
                ]


evalHandler :: [String] -> Handler App App ()
evalHandler eval = do
    lecture' <- getParam "lecture"
    case lecture' of
        Just lecture'' -> let lecture = B.unpack lecture''
                          in if lecture `elem` eval
                                then renderEval $ strToLecture lecture
                                else writeBS "Zur Zeit keine Evaluation verfügbar."
        _ -> writeBS "Keine Evaluation gefunden."

renderEval :: HasHeist b => Lecture -> Handler b v ()
renderEval lecture = do
    (view, res) <- runForm "form" evalForm
    case res of
        Just result -> do
            timestamp <- liftIO getCurrentTime
            liftIO $ do
                appendFile   (evalCSVFile    lecture) $ toCSV timestamp result
                T.appendFile (evalBestFile   lecture) $ textString timestamp question17 result
                T.appendFile (evalChangeFile lecture) $ textString timestamp question18 result
            renderEval' view "eval/eval"
        Nothing -> renderEval' view "eval/eval-form"
  where
    renderEval' view template =
        heistLocal (bindDigestiveSplices view) $
            renderWithSplices template
                [ ("lecture", textSplice $ longName lecture)
                , ("lec",textSplice $ shortName lecture)
                , ("semester",textSplice $ semester lecture)
                ]
    textString timestamp question result =
        pack (show timestamp)
          `append` ":\n"
          `append` question result
          `append` "\n------------------------\n"
    toCSV timestamp result =
            intercalate ";"
                [ show timestamp
                , maybe "" show $ question1   result
                , maybe "" show $ question2   result
                , maybe "" show $ question3   result
                , maybe "" show $ question4   result
                , maybe "" show $ question5   result
                , maybe "" show $ question6   result
                , maybe "" show $ question7   result
                , maybe "" show $ question8   result
                , maybe "" show $ question9   result
                , maybe "" show $ question10  result
                , maybe "" show $ question11  result
                , maybe "" show $ question12  result
                , maybe "" show $ question13  result
                , maybe "" show $ question14  result
                , maybe "" show $ question15  result
                , maybe "" show $ question16  result
                , maybe "" show $ question19  result
                , maybe "" show $ question20  result
                , maybe "" show $ question21  result
                , maybe "" show $ question22  result
                , maybe "" show $ question23  result
                , maybe "" show $ question24  result
                ,          show $ question25a result
                ,          show $ question25b result
                ,          show $ question25c result
                , maybe "" show $ question26  result
                ,          show $ question27  result
                ,          show $ question28  result
                ,          show $ question29  result
                ,          show $ question30  result
                ,          show $ question31  result
                ,          show $ question32  result
                ]
            ++ "\n"
