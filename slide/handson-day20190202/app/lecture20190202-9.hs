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
	exercise1_1, exercise1_2,
	exercise2_1, exercise2_2, exercise2_3,
	exercise3_1, exercise3_2, exercise3_3, exercise3_4,
	exercise4_1, exercise4_2, exercise4_3, exercise4_4,
	exercise4_5, exercise4_6, exercise4_7, exercise4_8
	]

title :: Page
title = writeTitle "Haskell入門" "9. 演習課題の解説 (1)" :| []

prelude :: Page
prelude = pageTitle "はじめに" :| [
	text "できただろうか",
	text "模範解答を示し、それを解説する"
	]

exercise1_1 :: Page
exercise1_1 = pageTitle "演習1. Hello, world!" :| [
	text "演習1は、標準出力への\"Hello, world!\"を書き出し",
	text "模範解答は、つぎのようになる",
	itext 4 "% vim samples/hello.hs",
	itext 4 "main :: IO ()",
	itext 4 "main = putStrLn \"Hello, world!\"",
	text "mainはIOであり、つぎのIOにわたす値はないので",
	itext 4 "型はIO ()となる",
	text "関数putStrLnの型はString -> IO ()であり",
	itext 4 "文字列を引数としてとり",
	itext 4 "その文字列を出力するIO値をかえす",
	text "そのIO値が変数mainを束縛する",
	text "そして、処理系がそのIO値を実行する"
	]

exercise1_2 :: Page
exercise1_2 = pageTitle "演習1. Hello, world!" :| [
	text "コンパイルして実行してみよう",
	itext 4 "% stack ghc -- samples/hello.hs -o hello",
	itext 4 "% ./hello",
	itext 4 "Hello, world!"
	]

exercise2_1 :: Page
exercise2_1 = pageTitle "演習2. 再帰、またはリスト" :| [
	text "演習2は、1からnまでの積をもとめる関数の作成",
	text "模範解答は、つぎのようになる",
	itext 4 "% vim samples/product0.hs",
	itext 4 "productN :: Integer -> Integer",
	itext 4 "productN 0 = 1",
	itext 4 "productN n = n * productN (n - 1)",
	text "productN 0は1で",
	itext 4 "productN nはnにproductN (n - 1)をかけたもの",
	text "ただ、これだと負の引数に対して、無限ループになるので",
	itext 8 "型宣言のつぎの行に、以下を追加しておく",
	itext 4 "productN n | n < 0 = error \"negative argument\""
	]

exercise2_2 :: Page
exercise2_2 = pageTitle "演習2. 再帰、またはリスト" :| [
	text "試してみる",
	itext 4 "% stack ghci",
	itext 4 "> :load samples/product0.hs",
	itext 4 "> productN 5",
	itext 4 "120"
	]

exercise2_3 :: Page
exercise2_3 = pageTitle "演習2. 再帰、またはリスト" :| [
	text "演習2の別解を、つぎに示す",
	itext 4 "% vim samples/product1.hs",
	itext 4 "productN :: Integer -> Integer",
	itext 4 "productN n = product [1 .. n]",
	text "[m .. n]は、mからnまで1ずつ増やしていった値の",
	itext 8 "すべてを要素とするリスト",
	text "関数productはリストの要素の",
	itext 4 "すべてをかけあわせた値を計算する関数",
	text "このように、直接再帰を使わずに",
	itext 4 "リストや、それをあつかう関数を利用して",
	itext 4 "その組み合わせで関数を作るほうがスマート"
	]

exercise3_1 :: Page
exercise3_1 = pageTitle "演習3. 代数的データ型" :| [
	text "演習3-1では、円と長方形を含むデータ型を作成する",
	text "模範解答は、つぎのようになる",
	itext 2 "% vim samples/figure.hs",
	itext 2 "data Figure =",
	itext 2 "        Circle Double | Rectangle Double Double",
	itext 2 "        deriving Show",
	text "値構築子CircleとRectangleをもつ型Figureを定義",
	text "値構築子Circleはふたつの、Rectangleはひとつの",
	itext 4 "Double型の値を保持する",
	text "deriving Showは対話環境で表示できるように"
	]

exercise3_2 :: Page
exercise3_2 = pageTitle "演習3. 代数的データ型" :| [
	text "対話環境で試してみる",
	itext 4 "% stack ghci",
	itext 4 "> :load samples/figure.hs",
	itext 4 "> Circle 3",
	itext 4 "Circle 3.0",
	itext 4 "> Rectangle 4 7",
	itext 4 "Rectangle 4.0 7.0"
	]

exercise3_3 :: Page
exercise3_3 = pageTitle "演習3. 代数的データ型" :| [
	text "演習3-2では、円と長方形の面積をもとめる",
	text "模範解答は、つぎのようになる",
	itext 4 "% vim samples/figure.hs",
	itext 4 "area :: Figure -> Double",
	itext 4 "area (Circle r) = r * r * pi",
	itext 4 "area (Rectangle w h) = w * h",
	text "パターンマッチで、それぞれの場合の",
	itext 4 "面積を計算している"
	]

exercise3_4 :: Page
exercise3_4 = pageTitle "演習3. 代数的データ型" :| [
	text "対話環境で試してみる",
	itext 4 "> :reload",
	itext 4 "> area (Circle 3)",
	itext 4 "28.274333882308138",
	itext 4 "> area (Rectangle 4 7)",
	itext 4 "28.0"
	]

exercise4_1 :: Page
exercise4_1 = pageTitle "演習4. 型クラス" :| [
	text "演習4-1では、型クラスBoolLikeを定義する",
	text "型クラスBoolLikeはBool値に変換できることを示す",
	text "型クラスBoolLikeはクラス関数toBoolをもつ",
	text "模範解答は、つぎのようになる",
	itext 4 "% vim samples/boolLike.hs",
	itext 4 "class BoolLike b where",
	itext 4 "        toBool :: b -> Bool",
	text "型クラスを定義している",
	text "クラス関数であるtoBoolは",
	itext 2 "インスタンスとなる型からBool型の値への変換をする"
	]

exercise4_2 :: Page
exercise4_2 = pageTitle "演習4. 型クラス" :| [
	text "対話環境に読み込んでみる",
	itext 4 "> :load samples/boolLike.hs",
	itext 4 "> :info BoolLike",
	itext 4 "class BoolLike b where",
	itext 4 "  toBool :: b -> Bool",
	itext 4 "  ...",
	text "コマンド:infoで",
	itext 4 "指定した要素の情報をみることができる",
	text "型クラスを定義しただけでは、あまり",
	itext 4 "なにもできないので情報をみてみた"
	]

exercise4_3 :: Page
exercise4_3 = pageTitle "演習4. 型クラス" :| [
	text "演習4-2では",
	itext 2 "型Integerを型クラスBoolLikeのインスタンスにする",
	text "模範解答は、つぎのようになる",
	itext 4 "% vim samples/boolLike.hs",
	itext 4 "instance BoolLike Integer where",
	itext 4 "        toBool 0 = False",
	itext 4 "        toBool _ = True",
	text "引数が0のときにはFalseを",
	itext 4 "それ以外のときにはTrueにする"
	]

exercise4_4 :: Page
exercise4_4 = pageTitle "演習4. 型クラス" :| [
	text "対話環境で試してみる",
	itext 4 "> :reload",
	itext 4 "> toBool (0 :: Integer)",
	itext 4 "False",
	itext 4 "> toBool (123 :: Integer)",
	itext 4 "True",
	text "数値リテラルは多相的なので",
	itext 4 "型注釈で型を指定している"
	]

exercise4_5 :: Page
exercise4_5 = pageTitle "演習4. 型クラス" :| [
	text "演習4-3では",
	itext 2 "型Charを型クラスBoolLikeのインスタンスにする",
	text "模範解答は、つぎのようになる",
	itext 4 "% samples/boolLike.hs",
	itext 4 "instance BoolLike Char where",
	itext 4 "        toBool '\\NUL' = False",
	itext 4 "        toBool _ = True",
	text "引数が'\\NUL'のときにはFalseを",
	itext 4 "それ以外のときにはTrueをかえす"
	]

exercise4_6 :: Page
exercise4_6 = pageTitle "演習4. 型クラス" :| [
	text "試してみる",
	itext 4 "> :reload",
	itext 4 "> toBool '\\NUL'",
	itext 4 "False",
	itext 4 "> toBool 'c'",
	itext 4 "True"
	]

exercise4_7 :: Page
exercise4_7 = pageTitle "演習4. 型クラス" :| [
	text "演習4-4では",
	itext 2 "型クラスBoolLikeのインスタンスである型の値を",
	itext 2 "ブール値として使用するmyIfを作成する",
	text "模範解答は、つぎのようになる",
	itext 4 "% vim samples/boolLike.hs",
	itext 4 "myIf :: BoolLike b => b -> a -> a -> a",
	itext 4 "myIf b t e = if toBool b then t else e",
	text "型クラス制約で型bをBoolLikeのインスタンスにしぼる",
	text "関数toBoolの返り値によって",
	itext 4 "Trueならtをかえし",
	itext 4 "Falseならeをかえすような定義になる"
	]

exercise4_8 :: Page
exercise4_8 = pageTitle "演習5. 型クラス" :| [
	text "対話環境で試してみる",
	itext 4 "> :reload",
	itext 4 "> myIf (0 :: Integer) \"OK!\" \"Bad!\"",
	itext 4 "\"Bad!\"",
	itext 4 "> myIf (123 :: Integer) \"OK!\" \"Bad!\"",
	itext 4 "\"OK!\"",
	itext 4 "> myIf '\\NUL' \"OK!\" \"Bad!\"",
	itext 4 "\"Bad!\"",
	itext 4 "> myIf 'c' \"OK!\" \"Bad!\"",
	itext 4 "\"OK!\""
	]
