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
	prelude, value1
	]

title :: Page
title = writeTitle "Haskell入門ハンズオン! #4" "1. 関数と型" :| []

prelude :: Page
prelude = pageTitle "対話環境" :| [
	text "「値」「関数」「型」について学ぶ",
	text "ここでは、対話環境に値を打ち込みながら学んでいく",
	text "対話環境はstackを使って処理系を構築した人だと",
	itext 4 "% stack ghci",
	text "そうでなければ",
	itext 4 "% ghci",
	text "(%はZshのプロンプト、入力しない)"
	]

value1 :: Page
value1 = pageTitle "対話環境" :| [
	text "とりあえず対話環境に「値」を打ち込んでみよう",
	itext 4 "> 123",
	itext 4 "123"
	]
