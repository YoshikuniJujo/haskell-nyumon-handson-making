module Main where

import Data.List.NonEmpty
import Graphics.X11.Slide

version :: Version
version = [0, 0, 0, 1]

main :: IO ()
main = runSlide version someSlide

someSlide :: Slide
someSlide = title :| [
	]

title :: Page
title = writeTitle "Haskell入門ハンズオン! #4" "0. はじめに" :| []
