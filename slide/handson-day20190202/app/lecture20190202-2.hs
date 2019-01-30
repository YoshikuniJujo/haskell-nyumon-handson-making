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
	prelude, tuple1, maybe1, maybe2, maybe3, maybe4,
	list1, list2, list3, list4,
	string1,
	case1, case2,
	summary
	]

title :: Page
title = writeTitle
	"Haskell入門" "2. タプルとMaybe値とリスト" :| []

prelude :: Page
prelude = pageTitle "はじめに" :| [
	text "Haskellでよく使われるデータ構造を学ぶ",
	itext 4 "* タプル",
	itext 4 "* Maybe値",
	itext 4 "* リスト"
	]

tuple1 :: Page
tuple1 = pageTitle "タプル" :| [
	text "ふたつの値をペアにしたいとき使う",
	itext 4 "> (123, 'c')",
	itext 4 "(123,'c')",
	text "ペアにした値のそれぞれを取り出したいときは",
	itext 8 "パターンマッチを使う",
	itext 4 "> f (n, c) = 2 * n",
	itext 4 "> f (123, 'c')",
	itext 4 "246",
	text "型宣言はつぎのようになる",
	itext 4 "p :: (Integer, Char)",
	itext 4 "p = (123, 'c')"
	]

maybe1 :: Page
maybe1 = pageTitle "Maybe値" :| [
	text "値が「ない」かもしれないときに使う",
	itext 4 "% vim samples/maybe.hs",
	itext 4 "safeDiv :: Integer -> Integer -> Maybe Integer",
	itext 4 "safeDiv _ 0 = Nothing",
	itext 4 "safeDiv a b = Just (a `div` b)",
	text "'_'(アンダースコア)は、引数を使用しないときに使う",
	itext 4 "「ワイルドカード」と呼ぶ",
	text "関数divは整数の除算を行う",
	itext 4 "``(バッククォート)でかこむと関数は演算子になる",
	text "除数が0のとき結果はない(Nothing)",
	text "そうでないときは結果をJustでくるむ"
	]

maybe2 :: Page
maybe2 = pageTitle "Maybe値" :| [
	text "試してみよう",
	itext 4 "> :load samples/maybe.hs",
	itext 4 "> safeDiv 35 4",
	itext 4 "Just 8",
	itext 4 "> safeDiv 15 0",
	itext 4 "Nothing"
	]

maybe3 :: Page
maybe3 = pageTitle "Maybe値" :| [
	text "Maybe値のなかみを使いたいときは",
	itext 8 "パターンマッチを使う",
	itext 2 "% vim samples/maybe.hs",
	itext 2 "addToMaybe :: Maybe Integer -> Integer ->",
	itext 2 "        Maybe Integer",
	itext 2 "addToMaybe Nothing _ = Nothing",
	itext 2 "addToMaybe (Just a) b = Just (a + b)",
	text "Nothingや(Just a)によってMaybe値をパターンマッチ",
	text "パターンマッチはうえから順に試されていく",
	text "マッチしたパターンに含まれる変数が",
	itext 4 "なかみの値に束縛される"
	]

maybe4 :: Page
maybe4 = pageTitle "Maybe値" :| [
	text "試してみる",
	itext 4 "> :reload",
	itext 4 "> addToMaybe (safeDiv 35 4) 7",
	itext 4 "Just 15"
	]

list1 :: Page
list1 = pageTitle "リスト" :| [
	text "おなじ型の値がたくさん必要なとき",
	itext 8 "リストを使う",
	itext 4 "> [123, 456, 789]",
	itext 4 "[123,456,789]"
	]

list2 :: Page
list2 = pageTitle "リスト" :| [
	text "リストを操作するにはパターンマッチと再帰を使う",
	itext 4 "% vim samples/list.hs",
	itext 4 "sumAll :: [Integer] -> Integer",
	itext 4 "sumAll [] = 0",
	itext 4 "sumAll (n : ns) = n + sumAll ns",
	text "リストは(n : ns)のようなパターンで",
	itext 4 "(先頭の値 : 残りの値)のようにわけられる",
	text "要素をもたないリストは[]で表わされる",
	text "要素をもたないリストの総和は0",
	text "先頭がnで残りがnsであるリストの総和は",
	itext 4 "値nにリストnsの総和をたしたもの"
	]

list3 :: Page
list3 = pageTitle "リスト" :| [
	text "試してみる",
	itext 4 "> :load samples/list.hs",
	itext 4 "> sumAll [5, 7, 9, 2]",
	itext 4 "23",
	itext 4 "> sumAll [123, 456, 789]",
	itext 4 "1368",
	itext 4 "> sumAll [2, 4, 5]",
	itext 4 "11"
	]

list4 :: Page
list4 = pageTitle "リスト" :| [
	text "定義を再掲する",
	itext 4 "sumAll [] = 0",
	itext 4 "sumAll (n : ns) = n + sumAll ns",
	text "展開してみよう",
	itext 4 "sumAll [2, 4, 5]",
	itext 4 "=> 2 + sumAll [4, 5]",
	itext 4 "=> 2 + (4 + sumAll [5])",
	itext 4 "=> 2 + (4 + (5 + sumAll []))",
	itext 4 "=> 2 + (4 + (5 + 0))",
	itext 4 "=> 11"
	]

string1 :: Page
string1 = pageTitle "文字列" :| [
	text "Haskellでは、デフォルトの文字列は文字のリスト",
	text "文字列は、つぎのように表記される",
	itext 4 "\"foobar\"",
	text "これは、つぎのリストとおなじ",
	itext 4 "['f', 'o', 'o', 'b', 'a', 'r']",
	text "たしかめてみよう",
	itext 4 "> \"foobar\"",
	itext 4 "\"foobar\"",
	itext 4 "> ['f', 'o', 'o', 'b', 'a', 'r']",
	itext 4 "\"foobar\""
	]

case1 :: Page
case1 = pageTitle "case式" :| [
	text "パターンマッチを関数定義ではなく",
	itext 8 "式のなかに書くにはcase式を使う",
	itext 4 "% vim samples/case.hs",
	itext 4 "import Data.Char",
	itext 4 "",
	itext 4 "checkAnswer :: Char -> Maybe Bool",
	itext 4 "checkAnswer c = case toLower c of",
	itext 4 "        'y' -> Just True",
	itext 4 "        'n' -> Just False",
	itext 4 "        _ -> Nothing",
	text "文字cをtoLowerで小文字化したものに対して",
	itext 4 "パターンマッチをおこなっている"
	]

case2 :: Page
case2 = pageTitle "case式" :| [
	text "試してみる",
	itext 4 "> :load samples/case.hs",
	itext 4 "> checkAnswer 'y'",
	itext 4 "Just True",
	itext 4 "> checkAnswer 'N'",
	itext 4 "Just False",
	itext 4 "> checkAnswer 'p'",
	itext 4 "Nothing"
	]

summary :: Page
summary = pageTitle "まとめ" :| [
	text "Haskellで用意されているデータ構造を紹介した",
	itext 4 "* タプル",
	itext 4 "* Maybe値",
	itext 4 "* リスト",
	text "なかみを取り出すにはパターンマッチを使う",
	text "リストのなかみをすべて利用するには",
	itext 4 "再帰関数を利用する",
	text "パターンマッチを「式のなか」でするには",
	itext 4 "case式を使う"
	]
