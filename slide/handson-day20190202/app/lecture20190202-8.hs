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
	exercise1, exercise2, exercise3, exercise3_2,
	exercise4, exercise4_2, exercise5
	]

title :: Page
title = writeTitle "Haskell入門" "8. 演習課題の説明" :| []

prelude :: Page
prelude = pageTitle "はじめに" :| [
	text "これから5題の演習問題を解いていただく",
	itext 4 "演習1. Hello, world!",
	itext 4 "演習2. 再帰、またはリスト",
	itext 4 "演習3. 代数的データ型",
	itext 4 "演習4. 型クラス",
	itext 4 "演習5. 計算クイズ",
	text "できなくても、問題ない",
	text "「考えてみる」ことで、あとの説明を",
	itext 4 "理解しやすくなるので",
	text "わからないところは質問してください"
	]

exercise1 :: Page
exercise1 = pageTitle "演習1. Hello, world!" :| [
	text "「Hello, world!」を標準出力(画面)に書き出す",
	itext 4 "1. コードを作成する",
	itext 4 "2. コンパイル・実行する",
	text "文字列を標準出力に書き出す関数はputStrLn",
	text "変数mainを束縛する(に代入された)入出力が実行される",
	text "コンパイルは、つぎのようにする",
	itext 4 "% stack ghc -- hello.hs -o hello",
	text "ちなみに、僕はタブ文字への警告を消したいので",
	itext 4 "% stack ghc -- -fno-warn-tabs hello.hs -o hello"
	]

exercise2 :: Page
exercise2 = pageTitle "演習2. 再帰、またはリスト" :| [
	text "1からnまでの積をもとめる",
	itext 4 "1. 関数を作成する",
	itext 4 "2. 対話環境で試してみる",
	text "作成する関数は「再帰関数」になる",
	text "つぎのように試す",
	itext 4 "% stack ghci",
	itext 4 "> :load product.hs",
	itext 4 "> productN 5",
	itext 4 "120"
	]

exercise3 :: Page
exercise3 = pageTitle "演習3. 代数的データ型" :| [
	text "円と長方形を含む型を作成し、面積をもとめる",
	itext 4 "1. 円と長方形を含む型を作成する",
	itext 4 "2. それらの面積をもとめる関数を作る",
	text "つぎのように使用できるようにする",
	itext 4 "> Circle 3",
	itext 4 "Circle 3",
	itext 4 "> Rectangle 4 7",
	itext 4 "Rectangle 4 7",
	itext 4 "> area (Circle 3)",
	itext 4 "28.274333882308138",
	itext 4 "> area (Rectangle 4 7)",
	itext 4 "28.0"
	]

exercise3_2 :: Page
exercise3_2 = pageTitle "演習3. 代数的データ型" :| [
	text "ヒント",
	itext 2 "データ型の定義の末尾にderiving Showをつける",
	itext 6 "対話環境で表示するため",
	itext 2 "関数areaの定義にはパターンマッチを使う"
	]

exercise4 :: Page
exercise4 = pageTitle "演習4. 型クラス" :| [
	itext (- 2) "Bool型の値以外を真偽値として使う",
	itext 0 "1. 「Bool値(False, True)に変換できる」性質を",
	itext 10 "示す型クラスを定義する",
	itext 4 "* 型クラスBoolLikeはクラス関数toBoolをもつ",
	itext 0 "2. 型Integerを型クラスBoolLikeのインスタンスにする",
	itext 4 "* toBool 0はFalse",
	itext 4 "* toBool xはxが0でなければTrue",
	itext 0 "3. 型Charを型クラスBoolLikeのインスタンスにする",
	itext 4 "* toBool '\\NUL'はFalse",
	itext 4 "* toBool cはcが'\\NUL'でなければTrue",
	itext 0 "4. 型クラスBoolLikeのインスタンスである型の値を",
	itext 10 "真偽値として使用するmyIfを作成する"
	]

exercise4_2 :: Page
exercise4_2 = pageTitle "演習4. 型クラス" :| [
	text "つぎのように使えるようにする",
	itext 4 "> toBool (0 :: Integer)",
	itext 4 "False",
	itext 4 "> toBool (3 :: Integer)",
	itext 4 "True",
	itext 4 "> toBool 'c'",
	itext 4 "True",
	itext 4 "> toBool '\\NUL'",
	itext 4 "False",
	itext 4 "> myIf 123 \"OK!\" \"Bad!\"",
	itext 4 "\"OK!\"",
	itext 4 "> myIf '\\NUL' \"OK!\" \"Bad!\"",
	itext 4 "\"Bad!\""
	]

exercise5 :: Page
exercise5 = pageTitle "演習5. 計算クイズ" :| [
	text "たし算、ひき算、かけ算の練習用ソフトを作成する",
	text "仕様は、つぎのようにする",
	itext 4 "* 計算はつぎの3種類",
	itext 8 "+ 0から100までの整数どおしのたし算",
	itext 8 "+ 0から100までの整数どおしのひき算",
	itext 8 "+ 0から9までの整数どおしのかけ算",
	itext 4 "* これらのなかからランダムに10問出題する",
	itext 4 "* ユーザはそれに対する答えを入力",
	itext 4 "* 正答か誤答かを表示",
	itext 4 "* 最後に何問正解したかという結果を表示する"
	]
