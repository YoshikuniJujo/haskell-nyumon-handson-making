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
	prelude, procedure1, procedure2,
	do1, do2, do3, do4, do5, do6, do7,
	stdio1, stdio2, stdio3, fileio1,
	currentTime1,
	if1, if2, if3,
	iteration1, iteration2,
	main1, main2,
	summary
	]

title :: Page
title = writeTitle "Haskell入門ハンズオン! #4" "6. IOモナド" :| []

prelude :: Page
prelude = pageTitle "はじめに" :| [
	text "Haskellでは入出力や状態変化をともなう処理は",
	itext 4 "IOモナドというかたちで、あつかわれる",
	text "「モナド」という、むずかしげな言葉に",
	itext 4 "おどろく必要はない",
	text "理解すれば、どうということはない概念だ",
	itext 4 "圏論とかを理解する必要はない",
	itext 4 "さまざまな処理を抽象化してくれる便利な道具だ",
	text "今回は「モナド」については、あまりふれない",
	text "IOモナドを「組み立て」という側面から説明する"
	]

procedure1 :: Page
procedure1 = pageTitle "手続き" :| [
	text "つぎのような「手続き」をみてみよう",
	itext 4 "puts \"hello\"",
	itext 4 "s = gets",
	itext 4 "puts s",
	text "これは、いちおうRubyの例だ",
	itext 4 "puts \"hello\"をしたあとに",
	itext 4 "getsをして、キーボード入力を変数sに代入し",
	itext 4 "その代入された値sをputsしている",
	text "この記法では",
	itext 4 "「AのつぎにBをする」という「関係」が",
	itext 4 "上下の位置によって暗黙に示されている"
	]

procedure2 :: Page
procedure2 = pageTitle "手続き" :| [
	text "再掲する",
	itext 4 "puts \"hello\"",
	itext 4 "s = gets",
	itext 4 "puts s",
	text "Rubyなどでは「暗黙に」示されている関係が",
	itext 8 "Haskellでは明示的に演算子になる",
	itext 4 "putStrLn \"hello\" >>",
	itext 4 "getLine >>=",
	itext 4 "\\s -> putStrLn s",
	text "「AのつぎにBをする」はA >> Bと表わされる",
	text "「Cの結果を利用してDをする」はC >>= Dだ",
	text "ここでDは「結果」を引数とする関数になる"
	]

do1 :: Page
do1 = pageTitle "do記法" :| [
	text "Haskellでは入出力は、演算子(>>)や(>>=)によって",
	itext 4 "「明示的に」組み合わされる",
	text "これはHaskellの美しさでもあり",
	itext 4 "コードを安全にきれいに書ける性質でもある",
	text "ただ、上から下に流れる処理というのは",
	itext 4 "メタファとして、わかりやすい",
	text "Haskellでは「美しさ」「安全性」を",
	itext 4 "犠牲にすることなく、あたかも",
	itext 4 "暗黙の前後関係をもつような書きかたができる",
	text "それがdo記法だ"
	]

do2 :: Page
do2 = pageTitle "do記法" :| [
	text "Haskellのコードを再掲する",
	itext 4 "putStrLn \"hello\" >>",
	itext 4 "getLine >>=",
	itext 4 "\\s -> putStrLn s",
	text "do記法を使うと",
	itext 4 "do      putStrLn \"hello\"",
	itext 4 "        s <- getLine",
	itext 4 "        putStrLn s",
	text "のようになる"
	]

do3 :: Page
do3 = pageTitle "do記法" :| [
	text "今回は時間がないので",
	itext 4 "このdo記法のかたちだけ覚えておこう",
	text "そのうらがわに、明示的な演算子による結合があると",
	itext 4 "知っておけばいい"
	]

do4 :: Page
do4 = pageTitle "do記法" :| [
	text "do記法で入出力処理を書いてみよう",
	itext 4 "% vim do.hs",
	itext 4 "io1 :: IO ()",
	itext 4 "io1 = do",
	itext 4 "        putStrLn \"hello\"",
	itext 4 "        s <- getLine",
	itext 4 "        putStrLn s",
	text "IOモナドの型は、入力される値がなければ",
	itext 4 "IO ()",
	text "変数io1を、do記法によって組み立てた",
	itext 4 "入出力を表す値で束縛した"
	]

do5 :: Page
do5 = pageTitle "do記法" :| [
	text "試してみる",
	itext 4 "> :load do.hs",
	itext 4 "> io1",
	itext 4 "hello",
	itext 4 "(適当に入力してエンター)world",
	itext 4 "world"
	]

do6 :: Page
do6 = pageTitle "do記法" :| [
	text "do記法のなかで使える予約語letを使った構文がある",
	itext 4 "% vim do.hs",
	itext 4 "io2 :: IO ()",
	itext 4 "io2 = do",
	itext 4 "        n <- getLine",
	itext 4 "        let     msg = \"Hello, \" ++ n ++ \"!\"",
	itext 4 "        putStrLn msg",
	text "このように、do記法のなかで変数を定義できる"
	]

do7 :: Page
do7 = pageTitle "do記法" :| [
	text "試してみる",
	itext 4 "> :reload",
	itext 4 "> io2",
	itext 4 "(名前を入力)Yoshio",
	itext 4 "Hello, Yoshio!"
	]

stdio1 :: Page
stdio1 = pageTitle "標準入出力" :| [
	text "いろいろな例を挙げる前に",
	itext 4 "標準入出力への入出力について学ぶ",
	text "標準入力はデフォルトではキーボードからの入力",
	text "標準出力はデフォルトでは画面への出力になる",
	text "このふたつは、すでに出てきたが",
	itext 4 "もういちど確認する"
	]

stdio2 :: Page
stdio2 = pageTitle "標準入出力" :| [
	text "対話環境で試してみる",
	itext 4 "> putStrLn \"hello\"",
	itext 4 "hello",
	itext 4 "> getLine",
	itext 4 "(適当に入力)world",
	itext 4 "\"world\"",
	text "関数putStrLnは文字列を引数にとり",
	itext 4 "その文字列を標準出力に出力する",
	text "入出力getLineは標準入力から1行入力し",
	itext 4 "それを「つぎの」入出力にわたす"
	]

stdio3 :: Page
stdio3 = pageTitle "標準入出力" :| [
	text "型をみてみよう",
	itext 4 "> :type putStrLn",
	itext 4 "putStrLn :: String -> IO ()",
	itext 4 "> :type getLine",
	itext 4 "getLine :: IO String",
	text "つぎにわたす値がないとき、入出の型は",
	itext 4 "IO ()",
	text "つぎにわたすのがString型の値のとき",
	itext 4 "IO String"
	]

fileio1 :: Page
fileio1 = pageTitle "ファイル入出力" :| [
	text "つぎに、ファイルへの入出力をみてみよう",
	itext 4 "> writeFile \"tmp_hnh.txt\" \"Haskell Handson!\\n\"",
	itext 4 "> readFile \"tmp_hnh.txt\"",
	itext 4 "\"Haskell Handson!\\n\"",
	text "writeFileは第1引数のファイルに",
	itext 8 "第2引数の文字列を書き込む",
	text "readFileは第1引数のファイルの内容を読み込む"
	]

currentTime1 :: Page
currentTime1 = pageTitle "現在時刻" :| [
	text "現在の時刻を手得する",
	text "時刻は入力値として手得される",
	itext 4 "> :module Data.Time",
	itext 4 "> getCurrentTime",
	itext 4 "2018-10-15 05:54:10.471924992 UTC",
	text ":moduleコマンドでモジュールData.Timeを",
	itext 4 "対話環境に導入している",
	text "入出力getCurrentTimeによって現在時刻が得られる",
	text "入出力getCurrentTimeの型は、つぎのようになる",
	itext 4 "> :type getCurrentTime",
	itext 4 "getCurrentTime :: IO UTCTime"
	]

if1 :: Page
if1 = pageTitle "分岐" :| [
	text "順接、分岐、反復の3つで",
	itext 4 "すべてのアルゴリズムが記述可能",
	text "「順接」は、「AのつぎにB」ということ、すでにみた",
	text "つぎは「分岐」をみてみよう",
	text "",
	text "標準出力に表示するか",
	itext 4 "ファイルに保存するかを選ぶ例",
	text "つぎのようなコードを書く"
	]

if2 :: Page
if2 = pageTitle "分岐" :| [
	itext (- 4) "% vim currentTime.hs",
	itext (- 4) "import Data.Time",
	itext (- 4) "",
	itext (- 4) "currentTime :: IO ()",
	itext (- 4) "currentTime = do",
	itext (- 4) "        putStrLn \"現在時刻を取得します\"",
	itext (- 4) "        now <- getCurrentTime",
	itext (- 4) "        putStrLn \"ファイルに保存しますか?(Y/N)\"",
	itext (- 4) "        s <- getLine",
	itext (- 4) "        if s == \"Y\" || s == \"y\"",
	itext (- 4) "                then writeFile \"currentTime.txt\"",
	itext (- 4) "                        (show now ++ \"\\n\")",
	itext (- 4) "                else putStrLn (show now)"
	]

if3 :: Page
if3 = pageTitle "分岐" :| [
	text "if式を使って分岐を記述することができた"
	]

iteration1 :: Page
iteration1 = pageTitle "反復" :| [
	text "反復、つまり「くりかえし」は再帰で書くことができる",
	itext 4 "% vim sum.hs",
	itext 4 "total :: Integer -> IO Integer",
	itext 4 "total s = do",
	itext 4 "        ln <- getLine",
	itext 4 "        let     n = read ln",
	itext 4 "        if n < 0",
	itext 4 "                then return s",
	itext 4 "                else total (s + n)",
	text "入力値が0より小さければ",
	itext 4 "sの値をかえし",
	itext 4 "そうでなければ、s + nを引数に自身を呼び出す"
	]

iteration2 :: Page
iteration2 = pageTitle "反復" :| [
	text "試してみる",
	itext 4 "> :load sum.hs",
	itext 4 "> total 0",
	itext 4 "3",
	itext 4 "24",
	itext 4 "11",
	itext 4 "- 1",
	itext 4 "38",
	text "3, 24, 11を入力し、終了させるために",
	itext 4 "- 1を入力した",
	text "3 + 24 + 11 = 38なので、38が表示される"
	]

main1 :: Page
main1 = pageTitle "独立して実行できるプログラム" :| [
	text "ここまで、対話環境で試してきた",
	text "ここで、コンパイルして",
	itext 4 "独立実行できる実行可能形式の作りかたを示す",
	text "Haskellでは",
	itext 4 "変数mainを束縛した入出力が実行される",
	text "sum.hsに入出力mainを追加する",
	itext 4 "% vim sum.hs",
	itext 4 "main :: IO ()",
	itext 4 "main = do",
	itext 4 "        s <- total 0",
	itext 4 "        print s"
	]

main2 :: Page
main2 = pageTitle "独立して実行できるプログラム" :| [
	text "つぎのようにしてコンパイルして、実行する",
	itext 4 "% stack ghc -- -fno-warn-tabs sum.hs -o sum",
	itext 4 "% ./sum",
	itext 4 "3",
	itext 4 "24",
	itext 4 "11",
	itext 4 "-1",
	itext 4 "38"
	]

summary :: Page
summary = pageTitle "まとめ" :| [
	text "Haskellでは入出力や状態変化をともなう",
	itext 4 "処理にはIOモナドという仕組みが使われる",
	text "IOモナドはモナドの一種だが",
	itext 4 "ここでは「モナド」については説明しない",
	text "手続き型言語では「暗黙に」されていた「組み立て」が",
	itext 4 "明示的な「演算子」によって、おこなわれる",
	text "手続き型言語のような書きかたのできるdo記法がある",
	text "順接、分岐、反復の実装をみた",
	text "Haskellでは、コンパイルされた実行可能形式は",
	itext 4 "変数mainを束縛した入出力を実行する"
	]
