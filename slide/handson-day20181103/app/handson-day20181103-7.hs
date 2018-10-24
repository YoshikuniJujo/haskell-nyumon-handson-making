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
	prelude,
	random1
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

random1 :: Page
random1 = pageTitle "乱数生成" :| [
	text "かつて標準的だったモジュールSystem.Randomは",
	itext 4 "パッケージrandomに含まれている",
	text "(このあたり、あとで確認する)",
	itext 4 "> :module System.Random",
	itext 4 "> randomIO :: IO Integer",
	itext 4 "7070170094128852650",
	itext 4 "> randomIO :: IO Double",
	itext 4 "0.19573673642621692",
	text "毎回ちがう乱数値を得るには",
	itext 4 "「なんらかの状態変化」が必要なので",
	itext 4 "randomIOは「入出力」になっている"
	]
