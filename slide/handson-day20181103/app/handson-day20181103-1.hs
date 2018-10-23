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
	prelude, value1, arithmetic1, it1, bind1,
	function1, function2, function3, sourceFile1,
	lambda1, lambda2, lambda3,
	operator1, operator2,
	guard1, eq1, if1, if2,
	let1, apply1, apply2,
	recPre, rec1, rec2,
	summary
	]

title :: Page
title = writeTitle "Haskell入門ハンズオン! #4" "1. 関数と型" :| []

prelude :: Page
prelude = pageTitle "対話環境" :| [
	text "「値」「関数」「型」について学ぶ",
	text "ここでは、対話環境に値を打ち込みながら学んでいく",
	text "対話環境はstackを使って処理系を構築した人だと",
	itext 4 "% stack ghci",
	text "そうでなければ",
	itext 4 "% ghci",
	text "(%はZshのプロンプト、入力しない)"
	]

value1 :: Page
value1 = pageTitle "値と型" :| [
	text "とりあえず対話環境に「値」を打ち込んでみよう",
	itext 4 "> 123",
	itext 4 "123",
	itext 4 "> 'c'",
	itext 4 "'c'",
	itext 4 "> True",
	itext 4 "True",
	text "値には「型」がある",
	itext 4 "> :type 'c'",
	itext 4 "'c' :: Char",
	itext 4 "> :type True",
	itext 4 "True :: Bool"
	]

arithmetic1 :: Page
arithmetic1 = pageTitle "四則演算" :| [
	text "四則演算もできる",
	itext 4 "> 3 + 5",
	itext 4 "8",
	itext 4 "> 12 - 7",
	itext 4 "5",
	itext 4 "> 3 * 12",
	itext 4 "36",
	itext 4 "> 38 `div` 4",
	itext 4 "9",
	itext 4 "> 38 / 4",
	itext 4 "9.5",
	text "整数のわり算と実数のわり算とは",
	itext 4 "意味がちがうので別になっている"
	]

it1 :: Page
it1 = pageTitle "直前の結果を使う" :| [
	text "対話環境では直前の結果を",
	itext 8 "変数itによって再利用できる",
	itext 4 "> 12345 * 67890",
	itext 4 "838102050",
	itext 4 "> it * 5",
	itext 4 "4190510250"
	]

bind1 :: Page
bind1 = pageTitle "変数を束縛する" :| [
	text "変数it以外も明示的に書けば、使える",
	itext 4 "> x = 123",
	itext 4 "> x * 2",
	itext 4 "246",
	itext 4 "> name = \"taro\"",
	itext 4 "> name",
	itext 4 "\"taro\"",
	text "変数に値をわりあてることを、つぎのようにいう",
	itext 4 "[値]が[変数]を束縛する",
	text "ほかの言語を使える人なら",
	itext 4 "[値]を[変数]に代入する",
	itext 2 "の「代入」を、関数型では「束縛」と",
	itext 4 "言い換えると考えれば(ここでは)いい"
	]

function1 :: Page
function1 = pageTitle "関数" :| [
	text "関数は引数をとる",
	text "引数をとった関数は値に評価される",
	itext 4 "> :module Data.Char",
	itext 4 "> toUpper 'c'",
	itext 4 "'C'",
	text "関数toUpperは引数を大文字にする関数",
	text "モジュールData.Charから公開されている",
	text "関数にも型がある",
	itext 4 "> :type toUpper",
	itext 4 "toUpper :: Char -> Char",
	text "Char型の引数をとって、Char型の値をかえす",
	text "関数の型は、引数と返り値の型を(->)でつないだもの"
	]

function2 :: Page
function2 = pageTitle "関数" :| [
	text "もうひとつの例",
	itext 4 "> isUpper 'c'",
	itext 4 "False",
	text "関数isUpperは引数が大文字ならばTrueを",
	itext 4 "そうでなければFalseをかえす",
	text "型をみてみよう",
	itext 4 "> :type isUpper",
	itext 4 "isUpper :: Char -> Bool",
	text "Char型の引数をとって、Bool型の値をかえす"
	]

function3 :: Page
function3 = pageTitle "関数の定義" :| [
	text "自分で関数を定義するには",
	itext 4 "[関数名] [引数1] [引数2] ... = [式]",
	text "実際に定義してみよう",
	itext 4 "> f x y = x + y",
	itext 4 "> f 3 4",
	itext 4 "7"
	]

sourceFile1 :: Page
sourceFile1 = pageTitle "ファイルから読み込み" :| [
	text "関数をファイルから読み込むこともできる",
	itext 4 "% vim simpleFun.hs",
	itext 4 "g x y = x + y",
	text "ファイルに定義した関数は:loadで読み込める",
	itext 4 "> :load simpleFun.hs",
	itext 4 "> g 3 4",
	itext 4 "7",
	text "関数には型宣言をつけておいたほうがいい",
	itext 4 "% vim simpleFun.hs",
	itext 4 "g :: Integer -> Integer -> Integer",
	itext 4 "g x y = x + y"
	]

lambda1 :: Page
lambda1 = pageTitle "関数リテラル" :| [
	text "3をたす関数を考える",
	itext 4 "> add3 n = n + 3",
	itext 4 "> add3 8",
	itext 4 "11",
	text "「3をたす関数」が変数add3を束縛している",
	text "その「3をたす関数」そのものを表すには",
	itext 4 "\\n -> n + 3",
	text "つぎのように書ける",
	itext 4 "> add3 = \\n -> n + 3",
	itext 4 "> add3 8",
	itext 4 "11"
	]

lambda2 :: Page
lambda2 = pageTitle "関数リテラル" :| [
	text "一般的に、関数リテラルはつぎのように書ける",
	itext 4 "\\引数1 引数2 ... -> 式",
	text "つぎのふたつの定義は、おなじことだ",
	itext 4 "関数名 引数1 引数2 ... = 式",
	itext 4 "関数名 = \\引数1 引数2 ... -> 式",
	text "うえのかたちは、したのかたちの構文糖と考えられる"
	]

lambda3 :: Page
lambda3 = pageTitle "関数リテラル" :| [
	text "関数リテラルは変数を束縛せずに使える",
	itext 4 "> (\\n -> n + 3) 8",
	itext 4 "11"
	]

operator1 :: Page
operator1 = pageTitle "演算子" :| [
	text "Haskellでは関数と演算子のちがいは構文だけ",
	text "()と``でたがいに変換できる",
	itext 4 "> mod 15 4",
	itext 4 "3",
	itext 4 "> 15 `mod` 4",
	itext 4 "3",
	itext 4 "> 12 + 25",
	itext 4 "37",
	itext 4 "> (+) 12 25",
	itext 4 "37"
	]

operator2 :: Page
operator2 = pageTitle "演算子" :| [
	text "演算子を関数に変換するとき",
	itext 4 "前か後ろのどちらかの引数を",
	itext 4 "あらかじめ適用しておくことができる",
	text "これを演算子の部分適用という",
	itext 4 "> (/ 5) 65",
	itext 4 "13.0",
	itext 4 "> (65 /) 5",
	itext 4 "13.0",
	text "(/ 5)は何かを5でわる関数になり",
	itext 4 "(65 /)は65を何かでわる関数になる"
	]

guard1 :: Page
guard1 = pageTitle "ガード" :| [
	text "関数を定義するときなどに",
	itext 4 "条件によって結果を変えることができる",
	text "ガードという構文が使える",
	itext 4 "%vim guard.hs",
	itext 4 "div2 :: Integer -> Integer",
	itext 4 "div2 n  | even n = n `div` 2",
	itext 4 "        | otherwise = n",
	text "ガードはつぎのような構文になる",
	itext 4 "| (Bool値をかえす式) = (結果の式)",
	text "ガードは関数定義のときに複数つけられる",
	text "otherwiseはTrueということ",
	text "つまり、「それ以外の場合」を受け入れる",
	text "関数evenは引数が偶数のときTrueをかえす"
	]

eq1 :: Page
eq1 = pageTitle "Bool値をかえす関数" :| [
	text "Bool値をかえす関数を述語とよぶ",
	itext 4 "> 12 == 12",
	itext 4 "True",
	itext 4 "> 3 == 9",
	itext 4 "False",
	itext 4 "> 3 < 15",
	itext 4 "True",
	itext 4 "> 3 >= 15",
	itext 4 "False",
	text "いくつかの述語をみた"
	]

if1 :: Page
if1 = pageTitle "if式" :| [
	text "真偽値によって処理を分岐させるには",
	itext 4 "ガードが使える",
	text "やっていることはおなじだが",
	itext 8 "構文的に異なる特徴をもつのがif式",
	itext 4 "> if 12 == 12 then \"good\" else \"bad\"",
	itext 4 "\"good\"",
	itext 4 "> if 3 >= 15 then \"foo\" else \"bar\"",
	itext 4 "\"bar\""
	]

if2 :: Page
if2 = pageTitle "(&&), (||), not" :| [
	text "真偽値に対する演算",
	itext 4 "> True && True",
	itext 4 "True",
	itext 4 "> True && False",
	itext 4 "False",
	itext 4 "> True || False",
	itext 4 "True",
	itext 4 "> False || False",
	itext 4 "False",
	itext 4 "> not True",
	itext 4 "False",
	text "それぞれ「かつ」「または」「...でない」"
	]

let1 :: Page
let1 = pageTitle "let式" :| [
	text "局所的に変数を束縛することができる",
	itext 4 "> let x = 8 in x + 5",
	itext 4 "13"
	]

apply1 :: Page
apply1 = pageTitle "関数適用演算子" :| [
	text "Haskellには関数を適用する演算子($)がある",
	itext 4 "> :module Data.Char",
	itext 4 "> toUpper 'x'",
	itext 4 "'X'",
	itext 4 "> toUpper $ 'x'",
	itext 4 "'X'",
	text "「いったい何の意味が?!!!」"
	]

apply2 :: Page
apply2 = pageTitle "関数適用演算子" :| [
	text "ひとつには「結合力」がある",
	text "演算子($)は結合力が最弱で右結合なので",
	itext 4 "f $ ...",
	itext 2 "のように書かれていたとき",
	itext 4 "...の部分がひとかたまりで",
	itext 4 "その全体に関数fを適用するということが",
	itext 4 "すぐにわかる",
	text "試してみよう",
	itext 4 "> negate 3 + 5",
	itext 4 "2",
	itext 4 "> negate $ 3 + 5",
	itext 4 "-8"
	]

recPre :: Page
recPre = pageTitle "再帰関数とは" :| [
	text "関数を定義するときに",
	itext 4 "定義のなかにその関数自体が出てくる",
	text "そのような関数を再帰関数と呼ぶ"
	]

rec1 :: Page
rec1 = pageTitle "再帰関数の例" :| [
	text "0からnまでの整数の和を計算する関数",
	itext 4 "% vim rec.hs",
	itext 4 "sum123 :: Integer -> Integer",
	itext 4 "sum123 0 = 0",
	itext 4 "sum123 n = sum123 (n - 1) + n",
	text "対話環境で試してみよう",
	itext 4 "> :load rec.hs",
	itext 4 "> sum123 8",
	itext 4 "36",
	itext 4 "> sum123 100",
	itext 4 "5050"
	]

rec2 :: Page
rec2 = pageTitle "再帰関数の例" :| [
	text "定義を再掲する",
	itext 4 "sum123 0 = 0",
	itext 4 "sum123 n = sum123 (n - 1) + n",
	text "n = 3について、展開してみよう",
	text "sum123 3",
	itext 4 "=> sum123 2 + 3",
	itext 4 "=> (sum123 1 + 2) + 3",
	itext 4 "=> ((sum123 0 + 1) + 2) + 3",
	itext 4 "=> ((0 + 1) + 2) + 3",
	itext 4 "6",
	itext 4 "(わかりやすさのため実際の評価とは変えている)"
	]

summary :: Page
summary = pageTitle "まとめ" :| [
	text "値、型、関数、再帰関数について学んだ",
	text "値には型がある",
	text "型は文字型Char、整数型Integer、真偽値型Boolなど",
	text "引数をとって返り値をかえすのが関数",
	text "関数にも型がある",
	itext 2 "[引数1の型] -> [引数2の型] -> ... -> [返り値の型]",
	text "ファイルに定義した関数を読み込むには:loadコマンド",
	text "定義に自分自身を使うのが再帰関数",
	itext 4 "例は0からnまでの和",
	text "再帰関数を使えば「くりかえし」を表現できる"
	]
