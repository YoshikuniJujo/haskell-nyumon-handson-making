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
title = writeTitle "Haskell入門ハンズオン! #4"
	"7. プロジェクト例のための知識" :| []

prelude :: Page
prelude = pageTitle "はじめに" :| [
	text "このあと、プロジェクト例を示すが",
	itext 4 "そのために必要な追加の知識をここで学ぶ",
	text "まずはHaskellにおいて、かつては、標準的だった",
	itext 4 "乱数生成ライブラリについて学ぶ"
	]
