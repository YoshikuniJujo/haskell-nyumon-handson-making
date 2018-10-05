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
	prelude, tuple1, maybe1, maybe2, maybe3, maybe4
	]

title :: Page
title = writeTitle
	"Haskell入門ハンズオン! #4" "2. タプルとリストとMaybe値" :| []

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
	itext 4 "% vim maybe.hs",
	itext 4 "safeDiv :: Integer -> Integer -> Maybe Integer",
	itext 4 "safeDiv _ 0 = Nothing",
	itext 4 "safeDiv a b = Just (a `div` b)",
	text "'_'(アンダースコア)は、引数を使用しないときに使う",
	text "関数divは整数の除算を行う",
	itext 4 "``(バッククォート)でかこむと関数は演算子になる",
	text "除数が0のとき結果はない(Nothing)",
	text "そうでないときは結果をJustでくるむ"
	]

maybe2 :: Page
maybe2 = pageTitle "Maybe値" :| [
	text "試してみよう",
	itext 4 "> :load maybe.hs",
	itext 4 "> safeDiv 35 4",
	itext 4 "Just 8",
	itext 4 "> safeDiv 15 0",
	itext 4 "Nothing"
	]

maybe3 :: Page
maybe3 = pageTitle "Maybe値" :| [
	text "Maybe値のなかみを使いたいときは",
	itext 8 "パターンマッチを使う",
	itext 2 "% vim maybe.hs",
	itext 2 "addToMaybe :: Maybe Integer -> Integer ->",
	itext 2 "        Maybe Integer",
	itext 2 "addToMaybe Nothing _ = Nothing",
	itext 2 "addToMaybe (Just a) b = Just (a + b)",
	text "Nothingや(Just a)によってMaybe値をパターンマッチ",
	text "パターンマッチはうえから順に試されていく",
	text "マッチしたパターンに含まれる変数が",
	itext 4 "なかみの値に束縛される",
	text "「変数が値に束縛される」は",
	itext 4 "「変数に値を代入する」を関数型的な言いかた"
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
	]
