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
	do1, do2
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
