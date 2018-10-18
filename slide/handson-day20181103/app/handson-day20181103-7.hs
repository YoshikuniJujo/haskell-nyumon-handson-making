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
	adt1, adt2, adt3, adt4, show1, show2, answer1, answer2,
	single1, single2, single3, multi1, multi2, main1, build1,
	summary
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

answer1 :: Page
answer1 = pageTitle "答えの計算" :| [
	text "答えを計算する",
	itext 4 "% vim app/Main.hs",
	itext 4 "answer :: Quiz -> Integer",
	itext 4 "answer (a :+: b) = a + b",
	itext 4 "answer (a :-: b) = a - b",
	itext 4 "answer (a :*: b) = a * b",
	text "それぞれの計算をしている"
	]

answer2 :: Page
answer2 = pageTitle "答えの計算" :| [
	text "試してみる",
	itext 4 "> :reload",
	itext 4 "> randomIO :: IO Quiz",
	itext 4 "49 :+: 69",
	itext 4 "> answer it",
	itext 4 "118",
	itext 4 "> randomIO :: IO Quiz",
	itext 4 "88 :-: 96",
	itext 4 "> answer it",
	itext 4 "-8"
	]

single1 :: Page
single1 = pageTitle "問題を、ひとつ出題" :| [
	text "問題を、ひとつ出題する",
	itext 0 "% vim app/Main.hs",
	itext 0 "quiz1 :: IO Bool",
	itext 0 "quiz1 = do",
	itext 0 "        q <- randomIO",
	itext 0 "        putStr $ showQuiz q",
	itext 0 "        hFlush stdout",
	itext 0 "        a <- getLine",
	itext 0 "        let     r = read a == answer q",
	itext 0 "        putStrLn $ if r then \"正解!!\" else \"残念...\"",
	itext 0 "        return r"
	]

single2 :: Page
single2 = pageTitle "問題を、ひとつ出題" :| [
	text "randomIOでランダムな問題を作成し",
	itext 4 "それで変数qを束縛",
	text "showQuizで文字列化して表示",
	text "標準出力のバッファをフラッシュする",
	text "標準入力から1行入力",
	text "「正答かどうか(read a == answer q)」で",
	itext 4 "変数rを束縛",
	text "それぞれについて「正解!!」「残念...」を表示",
	text "「正答かどうか」をつぎの入出力にわたす"
	]

single3 :: Page
single3 = pageTitle "問題を、ひとつ出題" :| [
	text "試してみる",
	itext 4 "> :reload",
	itext 4 "> quiz1",
	itext 4 "58 - 91 = -33",
	itext 4 "正解!!",
	itext 4 "True",
	itext 4 "> quiz1",
	itext 4 "83 - 9 = 123",
	itext 4 "残念...",
	itext 4 "False"
	]

multi1 :: Page
multi1 = pageTitle "問題を、複数出題" :| [
	text "問題を、複数出題して、結果をかえす",
	itext 0 "% vim app/Main.hs",
	itext 0 "quiz :: Integer -> Integer -> IO Integer",
	itext 0 "quiz n p",
	itext 0 "        | n < 1 = return p",
	itext 0 "        | otherwise = do",
	itext 0 "                r <- quiz1",
	itext 0 "                quiz (n - 1) (if r then p + 1 else p)",
	text "引数nは出題する問題数を示す",
	itext 4 "再帰的に呼び出されるたびに、1ずつ減少",
	itext 4 "1より小さくなったら終了",
	text "引数pは得点。正解なら1増やし、まちがいならそのまま",
	itext 4 "nが1より小さくなった時点で、pの値がかえされる"
	]

multi2 :: Page
multi2 = pageTitle "問題を、複数出題" :| [
	text "試してみる",
	itext 4 "> :reload",
	itext 4 "> quiz 3 0",
	itext 4 "46 - 90 = -44",
	itext 4 "正解!!",
	itext 4 "87 + 48 = 135",
	itext 4 "正解!!",
	itext 4 "6 * 0 = 123",
	itext 4 "残念...",
	itext 4 "2"
	]

main1 :: Page
main1 = pageTitle "入出力main" :| [
	text "入出力mainを定義する",
	itext 4 "% vim app/Main.hs",
	itext 4 "main :: IO ()",
	itext 4 "main = do",
	itext 4 "        p <- quiz 10 0",
	itext 4 "        putStrLn $ show p ++ \"/10\"",
	text "関数quizに引数として「10問」と「得点の初期値0」とを",
	itext 4 "あたえて実行し、結果の得点で変数pを束縛",
	text "得点pを表示",
	text "",
	text "はじめに仮に書いておいたmainを削除する"
	]

build1 :: Page
build1 = pageTitle "ビルド、実行" :| [
	text "ビルドして、実行してみる",
	itext 4 "% stack build",
	itext 4 "% stack exec calc-quiz-exe",
	itext 4 "1 * 0 = 0",
	itext 4 "正解!!",
	itext 4 "17 - 61 = -44",
	itext 4 "正解!!",
	itext 4 "34 - 43 = 123",
	itext 4 "残念...",
	itext 4 "(中略)",
	itext 4 "3 - 65 = -62",
	itext 4 "正解!!",
	itext 4 "8/10"
	]

summary :: Page
summary = pageTitle "まとめ" :| [
	text "Stackを使って、新規プロジェクトを作成した",
	text "簡単な計算問題を出題する例を作った"
	]
