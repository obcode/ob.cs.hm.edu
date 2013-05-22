{-# LANGUAGE OverloadedStrings #-}

module Lectures
    ( Lecture(..)
    , fun
    , seiiib
    , strToLecture
    ) where

import           Data.Text            (Text)
import           System.FilePath      ((</>))

evalDir :: FilePath
evalDir = "eval"

ss13 :: Text
ss13 = "Sommersemester 2013"

data Lecture = Lecture
    { shortName :: Text
    , longName  :: Text
    , semester :: Text
    , evalCSVFile :: FilePath
    , evalBestFile :: FilePath
    , evalChangeFile :: FilePath
    }
    deriving (Show)

fun :: Lecture
fun = Lecture
    { shortName      = "fun"
    , longName       = "Funktionale Programmierung"
    , semester       = ss13
    , evalCSVFile    = evalDir </> "evalFun.csv"
    , evalBestFile   = evalDir </> "evalFunBest.txt"
    , evalChangeFile = evalDir </> "evalFunChange"
    }

seiiib :: Lecture
seiiib = Lecture
    { shortName      = "seiiib"
    , longName       = "Softwareentwicklung II (IB)"
    , semester       = ss13
    , evalCSVFile    = evalDir </> "evalSeiiib.csv"
    , evalBestFile   = evalDir </> "evalSeiiibBest.txt"
    , evalChangeFile = evalDir </> "evalSeiiibChange.txt"
    }

strToLecture :: String -> Lecture
strToLecture "fun"    = fun
strToLecture "seiiib" = seiiib
strToLecture _        = error "lecture not found"
