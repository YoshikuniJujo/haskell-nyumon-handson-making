{-# OPTIONS_GHC -Wall -fno-warn-tabs #-}

module Main where

import Data.List.NonEmpty
import Graphics.X11.Slide

version :: Version
version = [0, 0, 0, 1]

main :: IO ()
main = runSlide version someSlide

someSlide :: Slide
someSlide = title :| [
	prelude
	]

title :: Page
title = writeTitle "Haskell入門ハンズオン! #4" "7. プロジェクトの例" :| []

prelude :: Page
prelude = pageTitle "はじめに" :| [
	text "簡単なプログラミングの例を紹介する"
	]