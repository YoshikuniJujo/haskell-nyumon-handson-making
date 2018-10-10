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
	prelude, maturable1, maturable2, buri1, buri2, buri3,
	poly1, poly2, collatz1, collatz2, collatz3, summary
	]

title :: Page
title = writeTitle "Haskell入門ハンズオン! #4" "5. 型クラス" :| []

prelude :: Page
prelude = pageTitle "はじめに" :| [
	text "どの型に対してでも使える関数の型を宣言するのに",
	itext 4 "型変数を使った",
	text "これは、たとえばリストなどの「構造の部分」に注目し",
	itext 4 "なかみの値には、さわらないことで実現されている",
	itext 4 "多相性だ",
	text "ここでは、それぞれの型に対して",
	itext 4 "専用の関数を定義することによる多相性を学ぶ"
	]

maturable1 :: Page
maturable1 = pageTitle "成熟する" :| [
	text "型クラスは、いくつかの型に共通する「性質」を表現",
	text "例として「成熟する」という性質を型クラスにする",
	itext 4 "% vim maturable.hs",
	itext 4 "class Maturable a where",
	itext 4 "        grow :: a -> a",
	itext 4 "        mature :: a -> Bool",
	text "予約語classを使って定義する",
	text "型クラス名はMaturableで、ふたつのクラス関数をもつ",
	itext 4 "grow: 成長した「つぎの段階」をかえす",
	itext 4 "mature: 成熟したかどうかを調べる"
	]

maturable2 :: Page
maturable2 = pageTitle "成熟する" :| [
	text "クラス関数の宣言部分を再掲する",
	itext 4 "grow :: a -> a",
	itext 4 "mature :: a -> Bool",
	text "関数growは問題になっている型aについて",
	itext 4 "成長前(a型の値)を引数として",
	itext 4 "成長後の値(a型の値)をかえす",
	text "関数matureは問題になっている型aについて",
	itext 4 "チェックする値(a型の値)を引数として",
	itext 4 "成熟したかどうか(Bool型の値)をかえす"
	]

buri1 :: Page
buri1 = pageTitle "ブリ" :| [
	text "「成熟するもの」として出世魚のブリがある",
	text "ブリをあらわすデータ型を定義する",
	itext 4 "% vim maturable.hs",
	itext 4 "data Buri = Tsubasu | Hamachi | Mejiro | Buri",
	itext 4 "        deriving Show",
	text "ブリは成長の過程で、つぎのように名前が変わる",
	itext 4 "ツバス -> ハマチ -> メジロ -> ブリ"
	]

buri2 :: Page
buri2 = pageTitle "ブリ" :| [
	text "型Buriを型クラスMaturableのインスタンスにする",
	itext 4 "% vim maturable.hs",
	itext 4 "instance Maturable Buri where",
	itext 4 "        grow Tsubasu = Hamachi",
	itext 4 "        grow Hamachi = Mejiro",
	itext 4 "        grow Mejiro = Buri",
	itext 4 "        grow Buri = Buri",
	itext 4 "        mature Buri = True",
	itext 4 "        mature _ = False",
	text "関数growは、それぞれ、成長後の値をかえす",
	text "関数matureは値BuriのみTrueとなる"
	]

buri3 :: Page
buri3 = pageTitle "ブリ" :| [
	text "試してみよう",
	itext 4 "> :load maturable.hs",
	itext 4 "> grow Hamachi",
	itext 4 "Mejiro",
	itext 4 "> mature Mejiro",
	itext 4 "False",
	itext 4 "> mature Buri",
	itext 4 "True"
	]

poly1 :: Page
poly1 = pageTitle "多相関数" :| [
	text "型クラスを利用した多相関数を定義する",
	itext 4 "% vim maturable.hs",
	itext 4 "growing :: Maturable a => a -> [a]",
	itext 4 "growing x",
	itext 4 "        | mature x = [x]",
	itext 4 "        | otherwise = x : growing (grow x)",
	text "ある値から成熟するまでの値をリストにする",
	text "growing xは",
	itext 4 "先頭がxで残りがgrowing (grow x)であるリストに",
	text "xのつぎからはじまるリストの先頭にxを追加している"
	]

poly2 :: Page
poly2 = pageTitle "多相関数" :| [
	text "試してみる",
	itext 4 "> :reload",
	itext 4 "> growing Tsubasu",
	itext 4 "[Tsubasu,Hamachi,Mejiro,Buri]"
	]

collatz1 :: Page
collatz1 = pageTitle "コラッツ数列" :| [
	text "任意の数ではじめて",
	itext 4 "偶数なら2でわる",
	itext 4 "奇数なら3倍して1たす",
	text "この操作を1になるまで、くりかえした数列",
	text "これをコラッツ数列と呼ぶ",
	text "たとえば26からはじめると",
	itext 4 "26 13 40 20 10 5 16 8 4 2 1"
	]

collatz2 :: Page
collatz2 = pageTitle "コラッツ数列" :| [
	text "このコラッツ数列をもとめる処理を",
	itext 8 "型クラスMaturableを利用して定義する",
	itext 4 "% vim maturable.hs",
	itext 4 "data Collatz = C Integer deriving Show",
	itext 4 "",
	itext 4 "instance Maturable Collatz where",
	itext 4 "        grow (C n)",
	itext 4 "                | even n = C (n `div` 2)",
	itext 4 "                | otherwise = C (3 * n + 1)",
	itext 4 "        mature (C 1) = True",
	itext 4 "        mature _ = False",
	text "関数growは、偶数と奇数のそれぞれに、つぎの値をかえす",
	text "関数matureは1であることを調べている"
	]

collatz3 :: Page
collatz3 = pageTitle "コラッツ数列" :| [
	text "試してみる",
	itext 1 "> :reload",
	itext 1 "> growing (C 26)",
	itext 1 "[C 26,C 13,C 40,C 20,C 10,C 5,C 16,C 8,C 4,C 2,C 1]"
	]

summary :: Page
summary = pageTitle "まとめ" :| [
	text "型クラスは型のもつ「性質」をあらわす",
	text "今回は「成熟する」という性質を定義した",
	text "型クラスMaturableを使うことで",
	itext 4 "* ひとつ前の項から、つぎの項が決まる",
	itext 4 "* 終了条件が定義されている",
	itext 2 "といった性質をもつ型をまとめられる",
	text "これを使うことで、ある値から終了条件までの",
	itext 4 "(数)列をかえす関数を抽象的に定義できる"
	]
