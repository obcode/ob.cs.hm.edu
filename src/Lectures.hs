{-# LANGUAGE OverloadedStrings #-}

module Lectures
    ( Lecture(..)
    , fun
    , seiiib
    , strToLecture
    ) where

import           Data.Text            (Text)

data Lecture = Lecture
    { shortName :: Text
    , longName  :: Text
    }
    deriving (Show)

fun :: Lecture
fun = Lecture
    { shortName = "fun"
    , longName = "Funktionale Programmierung"
    }

seiiib :: Lecture
seiiib = Lecture
    { shortName = "seiiib"
    , longName = "Softwareentwicklung II (IB)"
    }

strToLecture "fun"    = fun
strToLecture "seiiib" = seiiib
