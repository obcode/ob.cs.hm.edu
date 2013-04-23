{-# LANGUAGE OverloadedStrings #-}

module Eval
  ( evalHandler
  ) where

import           Application
import           Control.Applicative   ((<$>), (<*>))
import qualified Data.ByteString.Char8 as B
import           Data.Text             (Text)
import           Heist.Interpreted
import           Lectures
import           Snap.Core
import           Snap.Snaplet
import           Snap.Snaplet.Heist
import           Text.Digestive
import           Text.Digestive.Heist
import           Text.Digestive.Snap

data Eval = Eval
    { question1  :: Int
    , question2  :: Int
    , question3  :: Int
    , question4  :: Int
    , question5  :: Int
    , question6  :: Int
    , question7  :: Int
    , question8  :: Int
    , question9  :: Int
    , question10 :: Int
    , question11 :: Int
    , question12 :: Int
    , question13 :: Int
    , question14 :: Int
    , question15 :: Int
    , question16 :: Int
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
  where
    choiceList = [ (-1, "Nicht gewählt")
                 , (1,  "(1) genau")
                 , (2,  "(2)")
                 , (3,  "(3)")
                 , (4,  "(4)")
                 , (5,  "(5) überhaupt nicht")
                 , (0,"(0) ?")]

evalHandler :: [String] -> Handler App App ()
evalHandler eval = do
    lecture' <- getParam "lecture"
    case lecture' of
        -- Just "fun"    -> renderEval fun
        -- Just "seiiib" -> renderEval seiiib
        Just lecture'' -> let lecture = B.unpack lecture''
                          in if lecture `elem` eval
                                then renderEval $ strToLecture lecture
                                else writeBS "Zur Zeit keine Evaluation verfügbar."
        _ -> writeBS "Keine Evaluation gefunden."

renderEval lecture = do
    (view, result) <- runForm "form" evalForm
    case result of
        Just x  -> writeBS $ B.pack $ show (lecture,result)
        Nothing -> heistLocal (bindDigestiveSplices view) $
            renderWithSplices "eval/eval-form"
                [ ("lecture", textSplice $ longName lecture)
                , ("lec",textSplice $ shortName lecture)
                ]
