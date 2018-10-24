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
	int1,
	random1, random2, random3,
	janken1
	]

title :: Page
title = writeTitle "Haskell入門ハンズオン! #4"
	"7. プロジェクト例のための知識" :| []

prelude :: Page
prelude = pageTitle "はじめに" :| [
	text "このあと、プロジェクト例を示すが",
	itext 4 "そのために必要な追加の知識をここで学ぶ",
	text "まずは型Intを紹介する",
	text "つぎに、Haskellにおいて、かつては、標準的だった",
	itext 4 "乱数生成ライブラリについて学ぶ"
	]

int1 :: Page
int1 = pageTitle "整数型Int" :| [
	text "Haskellには多倍長整数Integerのほかに",
	itext 4 "固定長整数Intがある",
	text "Int型の値は処理系依存の最小値、最大値をもつ",
	itext 4 "> minBound :: Int",
	itext 4 "-9223372036854775808",
	itext 4 "> maxBound :: Int",
	itext 4 "9223372036854775807",
	text "minBound, maxBoundは多相的な値であり",
	itext 4 "それぞれの型について、その最小値、最大値を示す",
	text "64ビットOSでの値であり32ビットOSでは異なった値になる"
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
	itext 4 "randomIOは「入出力」になっている",
	text "randomIOは多相的なので、型注釈で型を指定している"
	]

random2 :: Page
random2 = pageTitle "型クラスRandom" :| [
	text "randomIOで乱数値を生成するには",
	itext 4 "生成される値の型が型クラスRandomの",
	itext 4 "インスタンスである必要がある",
	text "型クラスRandomは、だいたい",
	itext 8 "つぎのように定義されている",
	itext 0 "class Random a where",
	itext 0 "        randomR :: RandomGen g =>",
	itext 0 "                (a, a) -> g -> (a, g)",
	itext 0 "        random :: RandomGen g => g -> (a, g)",
	text "RandomGen gは型クラス制約であり、型gが",
	itext 4 "型クラスRandomGenのインスタンスであることを",
	itext 4 "示している"
	]

random3 :: Page
random3 = pageTitle "型クラスRandom" :| [
	text "型gが型クラスRandomGenのインスタンスならば",
	itext 8 "つぎの型gにたいして関数が存在する",
	itext 4 "next :: g -> (Int, g)",
	text "これは、g型の値が「乱数の種」であり",
	itext 4 "関数nextによって、Int型の乱数値と",
	itext 4 "新しい「乱数の種(g型の値)」とが生成される",
	itext 2 "ということ"
	]

janken1 :: Page
janken1 = pageTitle "じゃんけん型" :| [
	text "じゃんけん型を定義する",
	itext 4 "% vim janken.hs",
	itext 4 "import System.Random",
	itext 4 "",
	itext 4 "data Janken = Rock | Paper | Scissors",
	itext 4 "        deriving Show",
	text "じゃんけん型を型クラスRandomのインスタンスにする"
	]
