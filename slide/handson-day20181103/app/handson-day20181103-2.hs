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
	prelude, rec1, rec2
	]

title :: Page
title = writeTitle "Haskell入門ハンズオン! #4" "2. 再帰関数" :| []

prelude :: Page
prelude = pageTitle "再帰関数とは" :| [
	text "関数を定義するときに",
	itext 4 "定義のなかにその関数自体が出てくる",
	text "そのような関数を再帰関数と呼ぶ"
	]

rec1 :: Page
rec1 = pageTitle "再帰関数の例" :| [
	text "0からnまでの整数の和を計算する関数",
	itext 4 "% vim rec.hs",
	itext 4 "sum123 :: Integer -> Integer",
	itext 4 "sum123 0 = 0",
	itext 4 "sum123 n = sum123 (n - 1) + n",
	text "対話環境で試してみよう",
	itext 4 "> :load rec.hs",
	itext 4 "> sum123 8",
	itext 4 "36",
	itext 4 "> sum123 100",
	itext 4 "5050"
	]

rec2 :: Page
rec2 = pageTitle "再帰関数の例" :| [
	text "定義を再掲する",
	itext 4 "sum123 0 = 0",
	itext 4 "sum123 n = sum123 (n - 1) + n",
	text "n = 3について、展開してみよう",
	text "sum123 3",
	itext 4 "=> sum123 2 + 3",
	itext 4 "=> (sum123 1 + 2) + 3",
	itext 4 "=> ((sum123 0 + 1) + 2) + 3",
	itext 4 "=> ((0 + 1) + 2) + 3",
	itext 4 "6",
	itext 4 "(わかりやすさのため実際の評価とは変えている)"
	]
