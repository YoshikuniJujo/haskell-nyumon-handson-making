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
	prelude, point1, point2, convert1, dist1, dist2,
	expression1, expression2, expression3
	]

title :: Page
title = writeTitle "Haskell入門ハンズオン! #4" "4. 代数的データ型" :| []

prelude :: Page
prelude = pageTitle "はじめに" :| [
	text "Haskellでは新しい型をつくることができる",
	text "新しく作られたデータ型を代数的データ型と呼ぶ",
	text "ここでは直交座標系と極座標系の",
	itext 4 "両方で点を表現できるデータ型と",
	itext 4 "そのような点のふたつの距離を求める関数をみる"
	]

point1 :: Page
point1 = pageTitle "点をあらわすデータ型" :| [
	text "代数的データ型を定義するには予約語dataを使う",
	itext 4 "data 型の名前",
	itext 4 "        = 値構築子1 型1-1 型1-2 ...",
	itext 4 "        | 値構築子2 型2-1 型2-2 ...",
	text "点のデータ型を定義してみよう",
	itext 4 "% vim point.hs",
	itext 4 "data Point",
	itext 4 "        = Cartesian Double Double",
	itext 4 "        | Polar Double Double",
	itext 4 "        deriving Show",
	text "対話環境で表示できるように「deriving Show」をつけた"
	]

point2 :: Page
point2 = pageTitle "点をあらわすデータ型" :| [
	text "試してみよう",
	itext 4 "> :load point.hs",
	itext 4 "> Cartesian 3 8",
	itext 4 "Cartesian 3.0 8.0",
	itext 4 "> Polar 5 (pi / 6)",
	itext 4 "Polar 5.0 0.5235987755982988"
	]

convert1 :: Page
convert1 = pageTitle "(x, y)の値を取得" :| [
	text "2点間の距離をもとめるために",
	itext 8 "直交座標上のx, yの値を取得する",
	itext 4 "% vim point.hs",
	itext 4 "getXY :: Point -> (Double, Double)",
	itext 4 "getXY (Cartesian x y) = (x, y)",
	itext 4 "getXY (Polar d r) = (d * cos r, d * sin r)",
	text "試してみる",
	itext 4 "> :reload",
	itext 4 "> getXY (Cartesian 3 5)",
	itext 4 "(3.0, 5.0)",
	itext 4 "> getXY (Polar 8 (pi / 3))",
	itext 4 "(4.000000000000001,6.928203230275509)"
	]

dist1 :: Page
dist1 = pageTitle "点と点との距離" :| [
	text "2点間の距離をもとめる関数を定義する",
	itext 2 "% vim point.hs",
	itext 2 "dist :: Point -> Point -> Double",
	itext 2 "dist p1 p2 = sqrt ((x1 - x2) ^ 2 + (y1 - y2) ^ 2)",
	itext 2 "        where",
	itext 2 "        (x1, y1) = getXY p1",
	itext 2 "        (x2, y2) = getXY p2",
	text "where構文を使うと関数のなかで変数を定義できる",
	text "ここでは、それぞれの点のx座標、y座標を取得している"
	]

dist2 :: Page
dist2 = pageTitle "点と点との距離" :| [
	text "試してみる",
	itext 4 "> :reload",
	itext 4 "> dist (Cartesian 3 5) (Cartesian 7 8)",
	itext 4 "5.0",
	itext 4 "> dist (Polar 5 (pi / 6)) (Polar 11 (pi / 6))",
	itext 4 "6.000000000000001",
	itext 4 "> dist (Cartesian 3 5) (Polar 11 (pi / 6))",
	itext 4 "6.545404750680211"
	]

expression1 :: Page
expression1 = pageTitle "値構築演算子" :| [
	text "「関数」にたいして、中置記法の「演算子」がある",
	text "おなじように「値構築子」にたいして",
	itext 4 "「値構築演算子」がある",
	text "「関数」が小文字ではじまるのにたいして",
	itext 4 "「値構築子」は大文字ではじまる",
	text "おなじように「演算子」は':'以外の記号ではじまるが",
	itext 4 "「値構築演算子」は':'ではじまる記号列だ",
	itext 2 "         前置      中置",
	itext 2 "関数     foo       +++",
	itext 2 "値構築子 Foo       :+++"
	]

expression2 :: Page
expression2 = pageTitle "値構築演算子" :| [
	text "値構築演算子を定義してみる",
	itext 4 "% vim expression.hs",
	itext 4 "data Expr",
	itext 4 "        = Integer :+ Integer",
	itext 4 "        | Integer :- Integer",
	itext 4 "        | Integer :* Integer",
	itext 4 "        deriving Show"
	]

expression3 :: Page
expression3 = pageTitle "値構築演算子" :| [
	text "試してみる",
	itext 4 "> :load expression.hs",
	itext 4 "> 123 :+ 456",
	itext 4 "123 :+ 456",
	itext 4 "> 111 :* 33",
	itext 4  "111 :* 33"
	]
