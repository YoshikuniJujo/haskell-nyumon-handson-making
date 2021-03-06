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
	prelude, length1, length2, map1, map2, map3, map4,
	filter1, filter2, filter3,
	append1, append2,
	summary
	]

title :: Page
title = writeTitle
	"Haskell入門" "3. 多相性とリストをあつかう関数" :| []

prelude :: Page
prelude = pageTitle "はじめに" :| [
	text "Haskellの関数には型がある",
	itext 4 "toLower :: Char -> Char",
	itext 4 "isLower :: Char -> Bool",
	text "isLowerの引数はChar型の値でなければならず",
	itext 4 "返り値はChar型の値となる",
	text "リストの型は`[要素の型]'のように表現される",
	text "リストをあつかう関数には",
	itext 4 "どの「要素の型」に対しても使えるものがある",
	text "たとえば「リストの長さ」を求める関数",
	text "これは「リスト要素の型」には関係なく",
	itext 4 "どのような型の値を要素とするリストにも",
	itext 4 "使えるようであってほしい"
	]

length1 :: Page
length1 = pageTitle "長さを求める関数" :| [
	text "リストの長さを求める関数を定義する",
	itext 4 "% vim samples/list.hs",
	itext 4 "myLength [] = 0",
	itext 4 "myLength (_ : xs) = 1 + myLength xs",
	text "空リストの長さは0",
	text "空でないリストの長さは",
	itext 4 "1に残りのリストの長さを足したもの",
	text "試してみる",
	itext 4 "> :load samples/list.hs",
	itext 4 "> myLength [3, 7, 8, 9]",
	itext 4 "4"
	]

length2 :: Page
length2 = pageTitle "長さを求める関数" :| [
	text "リストの長さを求める関数に型宣言をつけたい",
	text "つぎのような意味の型として宣言したい",
	itext 4 "何らかの型のリスト -> Int",
	text "「何でもいい型」はHaskellでは小文字ではじまる",
	itext 4 "名前で表現される",
	text "この「何でもいい型」をあらわすものを型変数と呼ぶ",
	text "関数myLengthに型をつけてみよう",
	itext 4 "% vim samples/list.hs",
	itext 4 "myLength :: [a] -> Integer",
	text "何らかの型の値のリストを引数として",
	itext 4 "Integer型の値をかえす関数として宣言した"
	]

map1 :: Page
map1 = pageTitle "すべての要素に関数を適用する" :| [
	text "あたえられた関数を、すべての要素に適用する",
	itext 4 "> map (* 2) [3, 5, 8]",
	itext 4 "[6,10,16]",
	text "(* 2)は演算子の部分適用",
	text "*の左側を引数でうめるような関数になる",
	itext 4 "つまり「何かを2倍する関数」",
	text "関数mapによって(* 2)をリストのすべての",
	itext 4 "要素に適用している",
	text "関数mapの型をみてみよう",
	itext 4 "> :type map",
	itext 4 "map :: (a -> b) -> [a] -> [b]"
	]

map2 :: Page
map2 = pageTitle "すべての要素に関数を適用する" :| [
	text "関数mapの型を再掲する",
	itext 4 "map :: (a -> b) -> [a] -> [b]",
	text "型aの値から型bの値を計算する関数と",
	itext 4 "型aの値のリストを引数としてとり",
	itext 4 "型bの値のリストを返り値としてかえす"
	]

map3 :: Page
map3 = pageTitle "すべての要素に関数を適用する" :| [
	text "関数mapとおなじ関数を定義する",
	itext 4 "% vim samples/list.hs",
	itext 4 "myMap :: (a -> b) -> [a] -> [b]",
	itext 4 "myMap _ [] = []",
	itext 4 "myMap f (x : xs) = f x : myMap f xs",
	text "空リストは空リスト",
	text "先頭がxで残りがxsであるようなリストは",
	itext 4 "先頭がf xであり残りがリストxsのすべてに",
	itext 4 "関数fを適用したリスト"
	]

map4 :: Page
map4 = pageTitle "すべての要素に関数を適用する" :| [
	text "関数myMapを試してみる",
	itext 4 "> :load samples/list.hs",
	itext 4 "> myMap (* 2) [3, 5, 8, 7]",
	itext 4 "[6,10,16,14]"
	]

filter1 :: Page
filter1 = pageTitle "条件を満たす値だけ取り出す" :| [
	text "条件を満たす値だけ取り出してみる",
	itext 4 "> filter even [3, 8, 7, 2, 9]",
	itext 4 "[8,2]",
	text "関数evenは引数が偶数のときにTrueをかえす関数",
	text "関数filterの型をみてみよう",
	itext 4 "> :type filter",
	itext 4 "filter :: (a -> Bool) -> [a] -> [a]",
	text "「a型の値を引数としてとり、Bool型の値をかえす関数」と",
	itext 4 "a型の値のリストを引数としてとり、",
	itext 4 "a型の値のリストを返り値としてかえす"
	]

filter2 :: Page
filter2 = pageTitle "条件を満たす値だけを取り出す" :| [
	text "関数filterとおなじ関数を定義してみる",
	itext 4 "% vim samples/list.hs",
	itext 4 "myFilter :: (a -> Bool) -> [a] -> [a]",
	itext 4 "myFilter _ [] = []",
	itext 4 "myFilter p (x : xs)",
	itext 4 "        | p x = x : myFilter p xs",
	itext 4 "        | otherwise = myfilter p xs",
	text "値xが条件pを満たすときだけ",
	itext 4 "xが結果のリストに追加されている"
	]

filter3 :: Page
filter3 = pageTitle "条件を満たす値だけを取り出す" :| [
	text "試してみる",
	itext 4 "> :load samples/list.hs",
	itext 4 "> myFilter even [3, 8, 5, 2, 1, 9, 10]",
	itext 4 "[8,2,10]"
	]

append1 :: Page
append1 = pageTitle "リストを結合する" :| [
	text "リストを結合するには演算子(++)を使う",
	itext 4 "> \"Hello\" ++ \"World\"",
	itext 4 "\"HelloWorld\"",
	text "リストを結合する演算子を自分で定義してみる",
	itext 4 "% vim samples/list.hs",
	itext 4 "(.++) :: [a] -> [a] -> [a]",
	itext 4 "(x : xs) .++ ys = x : (xs .++ ys)",
	itext 4 "[] .++ ys = ys",
	text "(x : xs)とysとを結合したリストは",
	itext 4 "xsとysとを結合したリストの先頭にxを追加したもの",
	text "空リストとリストysとを結合したリストは",
	itext 4 "リストysそのもの"
	]
append2 :: Page
append2 = pageTitle "リストを結合する" :| [
	text "試してみる",
	itext 4 "> :load samples/list.hs",
	itext 4 "> \"Hello\" .++ \"World\"",
	itext 4 "\"HelloWorld\""
	]

summary :: Page
summary = pageTitle "まとめ" :| [
	text "リストをあつかう関数をみた",
	itext 4 "* myLength",
	itext 4 "* map",
	itext 4 "* filter",
	itext 4 "* 演算子(++)",
	text "要素の型を問わない関数では",
	itext 4 "型変数を使って型宣言をする"
	]
