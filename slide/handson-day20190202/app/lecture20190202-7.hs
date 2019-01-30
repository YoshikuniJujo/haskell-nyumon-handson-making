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
	janken1, janken2, janken3,
	hFlush1, hFlush2, hFlush3, hFlush4, hFlush5, hFlush6
	]

title :: Page
title = writeTitle "Haskell入門"
	"7. 演習のための追加の知識" :| []

prelude :: Page
prelude = pageTitle "はじめに" :| [
	text "このあとの演習のために必要な追加の知識をここで学ぶ",
	text "まずは型Intを紹介する",
	text "つぎに、Haskellにおいて、かつては、標準的だった",
	itext 4 "乱数生成ライブラリについて学ぶ",
	text "最後に、標準入出力はデフォルトで",
	itext 4 "バッファリングされているので",
	itext 4 "内容を即座に入(出)力する方法を学ぶ"
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
	text "かつて標準的だったモジュールSystem.Randomを使う",
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
	itext 4 "% vim samples/janken.hs",
	itext 4 "import System.Random",
	itext 4 "",
	itext 4 "data Janken = Rock | Paper | Scissors",
	itext 4 "        deriving Show",
	text "じゃんけん型を型クラスRandomのインスタンスにする"
	]

janken2 :: Page
janken2 = pageTitle "じゃんけん型" :| [
	itext 2 "% vim samples/janken.hs",
	itext 2 "instance Random Janken where",
	itext 2 "        randomR = undefined",
	itext 2 "        random g = let (n, g') = next g in",
	itext 2 "                case n `mod` 3 of",
	itext 2 "                        0 -> (Rock, g')",
	itext 2 "                        1 -> (Paper, g')",
	itext 2 "                        2 -> (Scissors, g')",
	itext 2 "                        _ -> error \"never occur\"",
	text "関数randomRは「範囲を指定して乱数値を得る」関数",
	text "いまは使わないので、とりあえずundefinedにしておく",
	text "関数randomは「乱数の種」から、乱数値と新しい種をつくる",
	text "関数nextでInt型の値をつくり、それを3通りの値に変換"
	]

janken3 :: Page
janken3 = pageTitle "じゃんけん型" :| [
	text "試してみる",
	itext 4 "> :load samples/janken.hs",
	itext 4 "> randomIO :: IO Janken",
	itext 4 "Scissors",
	itext 4 "> randomIO :: IO Janken",
	itext 4 "(おなじ式を入力するには上矢印を入力する)",
	itext 4 "Paper",
	itext 4 "> randomIO :: IO Janken",
	itext 4 "Scissors",
	itext 4 "> randomIO :: IO Janken",
	itext 4 "Rock"
	]

hFlush1 :: Page
hFlush1 = pageTitle "バッファリング" :| [
	text "標準入出力はバッファリングされている",
	text "標準入出力のバッファリングのモードを表示する",
	itext 4 "% vim samples/buffer.hs",
	itext 4 "import System.IO",
	itext 4 "",
	itext 4 "main :: IO ()",
	itext 4 "main = do",
	itext 4 "        bi <- hGetBuffering stdin",
	itext 4 "        bo <- hGetBuffering stdout",
	itext 4 "        print bi",
	itext 4 "        print bo"
	]

hFlush2 :: Page
hFlush2 = pageTitle "バッファリング" :| [
	text "コンパイル・実行",
	itext 4 "% stack ghc -- samples/buffer.hs -o buffer",
	itext 4 "./buffer",
	itext 4 "LineBuffering",
	itext 4 "LineBuffering",
	text "標準入力、標準出力ともにLineBuffering",
	text "つまり、改行が入力(出力)されるまで",
	itext 4 "入力(出力)はバッファリングされる"
	]

hFlush3 :: Page
hFlush3 = pageTitle "hFlush" :| [
	text "標準出力への出力は改行の出力まで、おくらされる",
	text "これは、たとえば「質問」の出力のあとで",
	itext 4 "改行したくないようなとき、こまる",
	itext 2 "% vim samples/yesno0.hs",
	itext 2 "main :: IO ()",
	itext 2 "main = do",
	itext 2 "        putStr \"どうする?(Y/N): \"",
	itext 2 "        a <- getLine",
	itext 2 "        putStrLn $ \"Your answer is \" ++ a ++ \".\""
	]

hFlush4 :: Page
hFlush4 = pageTitle "hFlush" :| [
	text "コンパイル・実行",
	itext 4 "% stack ghc -- samples/yesno0.hs -o yesno",
	itext 4 "./yesno",
	itext 4 "(入力)foo",
	itext 4 "どうする?(Y/N): Your answer is foo.",
	text "質問が表示されるまえに、入力が必要になる"
	]

hFlush5 :: Page
hFlush5 = pageTitle "hFlush" :| [
	text "バッファをフラッシュする必要がある",
	text "先頭にimport文を追加",
	itext 4 "% vim samples/yesno1.hs",
	itext 4 "import System.IO",
	text "質問文の表示のあとにhFlushを追加",
	itext 4 "% vim samples/yesno1.hs",
	itext 4 "...",
	itext 4 "        putStr \"どうする?(Y/N): \"",
	itext 4 "        hFlush stdout",
	itext 4 "..."
	]

hFlush6 :: Page
hFlush6 = pageTitle "hFlush" :| [
	text "コンパイル・実行",
	itext 4 "% stack ghc -- samples/yesno1.hs -o yesno",
	itext 4 "./yesno",
	itext 4 "どうする?(Y/N): (入力)Y",
	itext 4 "Your answer is Y.",
	text "hFlushをすることで、改行を待たずに表示される"
	]
