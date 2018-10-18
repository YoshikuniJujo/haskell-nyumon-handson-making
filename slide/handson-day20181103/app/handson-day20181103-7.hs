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
	prelude, specification1,
	new1, new2, import1, import2,
	adt1, adt2, adt3, adt4, show1, show2
	]

title :: Page
title = writeTitle "Haskell入門ハンズオン! #4" "7. プロジェクトの例" :| []

prelude :: Page
prelude = pageTitle "はじめに" :| [
	text "プログラミングの例を紹介する",
	text "簡単な足し算、引き算、かけ算のクイズゲームの例",
	text "stackを使って、新規のプロジェクトとして作成する"
	]

specification1 :: Page
specification1 = pageTitle "仕様" :| [
	text "0から100までの整数どおしのたし算、ひき算と",
	itext 4 "0から9までの整数どおしのかけ算とを",
	itext 4 "ランダムに10問、出題し、最後に結果を表示する"
	]

new1 :: Page
new1 = pageTitle "プロジェクトの作成" :| [
	text "Stackのプロジェクトを新規に作成する",
	itext 4 "% stack new calc-quiz",
	text "ディレクトリcalc-quiz/ができるので、そこに移動",
	itext 4 "% cd calc-quiz",
	text "app/Main.hsを書き換える",
	itext 4 "% vim app/Main.hs",
	itext 4 "module Main where",
	itext 4 "",
	itext 4 "main :: IO ()",
	itext 4 "main = putStrLn \"Love Haskell\""
	]

new2 :: Page
new2 = pageTitle "プロジェクトの作成" :| [
	text "ビルドを試す",
	itext 4 "% stack build",
	text "ビルドされた実行可能ファイルを実行する",
	itext 4 "% stack exec calc-quiz-exe",
	itext 4 "Love Haskell"
	]

import1 :: Page
import1 = pageTitle "導入するモジュール" :| [
	text "まず(僕のポリシーとして)",
	itext 4 "ほかのすべての警告を有効にして",
	itext 4 "タブ文字への警告をつぶす",
	text "ファイルの先頭に追加する",
	itext 4 "% vim app/Main.hs",
	itext 4 "{-# OPTIONS_GHC -Wall -fno-warn-tabs #-}",
	text "必要なモジュールを導入する",
	text "module Main whereのしたに追加",
	itext 4 "% vim app/Main.hs",
	itext 4 "import System.IO",
	itext 4 "import System.Random"
	]

import2 :: Page
import2 = pageTitle "導入するモジュール" :| [
	text "ビルドを試す",
	itext 4 "% stack build",
	text "エラーが出るはずだ",
	itext 4 "Could not find module `System.Random'",
	text "モジュールSystem.Randomはパッケージrandomに含まれる",
	text "package.yamlを編集する",
	text "dependenciesにrandomを追加",
	itext 4 "% vim package.yaml",
	itext 4 "dependencies:",
	itext 4 "- base >= 4.7 && < 5",
	itext 4 "- random",
	itext 4 "% stack build",
	text "今度はうまくいくはずだ"
	]

adt1 :: Page
adt1 = pageTitle "型Quiz" :| [
	text "1問1問の計算問題をあらわす型Quizを定義する",
	itext 4 "% vim app/Main.hs",
	itext 4 "data Quiz",
	itext 4 "        = Integer :+: Integer",
	itext 4 "        | Integer :-: Integer",
	itext 4 "        | Integer :*: Integer",
	itext 4 "        deriving Show",
	text "対話環境で試してみる",
	itext 4 "% stack ghci",
	itext 4 "> 12 :+: 5",
	itext 4 "12 :+: 5",
	text "型Quizをランダムに出題するために",
	itext 8 "クラスRandomのインスタンスにする"
	]

adt2 :: Page
adt2 = pageTitle "ランダム" :| [
	itext (- 4) "instance Random Quiz where",
	itext (- 4) "        randomR = undefined",
	itext (- 4) "        random g = let",
	itext (- 4) "                (a, g') = randomR (0, 100) g",
	itext (- 4) "                (b, g'') = randomR (0, 100) g'",
	itext (- 4) "                (o, g''') = randomR (0, 2) g''",
	itext (- 4) "                q = case o :: Integer of",
	itext (- 4) "                        0 -> a :+: b",
	itext (- 4) "                        1 -> a :-: b",
	itext (- 4) "                        2 -> (a `mod` 10) :*: (b `mod` 10)",
	itext (- 4) "                        _ -> error \"never occur\" in",
	itext (- 4) "                (q, g''')"
	]

adt3 :: Page
adt3 = pageTitle "ランダム" :| [
	text "randomRは最小値と最大値を指定することで",
	itext 4 "特定の範囲内でのランダム値を生成する関数",
	text "Quiz型では定義されない",
	text "ここでは値undefinedで束縛してある",
	text "0から100までのランダム値をふたつ(a, b)と",
	itext 4 "0から2までのランダム値をひとつ(o)用意",
	text "case式でoの値によって演算を選んでいる",
	text "かけ算のときは",
	itext 4 "10の剰余をとることで0から9までの値にしている",
	text "最後に結果の値と「新しい乱数の種」をペアにしてかえす"
	]

adt4 :: Page
adt4 = pageTitle "ランダム" :| [
	text "試してみる",
	itext 4 "> :reload",
	itext 4 "> randomIO :: IO Quiz",
	itext 4 "58 :-: 23",
	itext 4 "> randomIO :: IO Quiz",
	itext 4 "63 :+: 96",
	itext 4 "> randomIO :: IO Quiz",
	itext 4 "17 :-: 44",
	itext 4 "> randomIO :: IO Quiz",
	itext 4 "4 :*: 0"
	]

show1 :: Page
show1 = pageTitle "問題の表示" :| [
	text "問題を文字列に変換する関数",
	itext (- 4) "% vim app/Main.hs",
	itext (- 4) "showQuiz :: Quiz -> String",
	itext (- 4) "showQuiz (a :+: b) = show a ++ \" + \" ++ show b ++ \" = \"",
	itext (- 4) "showQuiz (a :-: b) = show a ++ \" - \" ++ show b ++ \" = \"",
	itext (- 4) "showQuiz (a :*: b) = show a ++ \" * \" ++ show b ++ \" = \"",
	text "それぞれの値について",
	itext 4 "それぞれの文字列を組み立てている"
	]

show2 :: Page
show2 = pageTitle "問題の表示" :| [
	text "試してみる",
	itext 4 "> :reload",
	itext 4 "> randomIO :: IO Quiz",
	itext 4 "9 :*: 6",
	itext 4 "> showQuiz it",
	itext 4 "\"9 * 6 = \""
	]
