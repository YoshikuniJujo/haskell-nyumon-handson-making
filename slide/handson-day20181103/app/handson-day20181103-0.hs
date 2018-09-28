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
	selfIntroduction1, selfIntroduction2, selfIntroduction3,
	selfIntroduction4
	]

title :: Page
title = writeTitle "Haskell入門ハンズオン! #4" "0. はじめに" :| []

prelude :: Page
prelude = pageTitle "ごあいさつ" :| [
	text "おあつまりいただき、ありがとうございます",
	writeImage 0.3 0.25 170 210 "image/cover.png",
	text "「Haskell - 教養としての関数型プログラミング」の",
	itext 20 "著者です"
	]

selfIntroduction1 :: Page
selfIntroduction1 = pageTitle "自己紹介" :| [
	text "コンピュータとの出会いはMSX",
	itext 3 "コンピュータクラブに入部",
	itext 3 "(家には父のPC-98があった)",
	writeImage 0.65 0.1 170.6666 117.8333 "image/msx.JPG",
	text "* 2006年にMacがPowerPCからPC/AT互換機になってから",
	itext 5 "一般的なパソコンは、ほぼPC/AT互換機になった",
	text "* それよりも、ずっと昔、パソコンのアーキテクチャが",
	itext 5 "群雄割拠だった時代(1980年代)",
	text "* マイクロソフトとアスキーが提唱した",
	itext 5 "パソコンのアーキテクチャ(1983)",
	text "* 任天堂のファミコン(1983)に負けてしまう"
	]

selfIntroduction2 :: Page
selfIntroduction2 = pageTitle "自己紹介" :| [
	text "MSXにはROM上にBASICが内蔵されていた",
	text "BASIC言語によるプログラミングは、つぎのような感じ",
	itext 5 "10 REM 5つ数える(\"3\"だけ飛ばす)",
	itext 5 "20 FOR I = 1 TO 5",
	itext 5 "25 IF I = 3 THEN GOTO 40",
	itext 5 "30 PRINT I",
	itext 5 "40 NEXT",
	itext 5 "RUN",
	text "基本的にGOTO文を多用し",
	itext 5 "行番号を指定して、そこに飛ぶ仕組み"
	]

selfIntroduction3 :: Page
selfIntroduction3 = pageTitle "自己紹介" :| [
	text "大学時代にPerlに出会う",
	text "その後、C言語、Ruby、Python、Common Lisp、Scheme",
	itext 4 "などなどに手を出す",
	text "最終的に2003年にHaskellに出会う",
	text "以降はHaskell一筋",
	text "なのでHaskell歴15年だ",
	text "ちなみにOSは2002年からGentooを使っている",
	text "なのでGentoo歴は16年ということになる"
	]

selfIntroduction4 :: Page
selfIntroduction4 = pageTitle "自己紹介" :| [
	text "だいたい、つぎのようになる",
	itext 4 "Haskell歴 15年",
	itext 4 "Gentoo歴 16年",
	itext 4 "Vim派",
	itext 4 "漢字直接入力(TUT-code)",
	itext 4 "シェルはZsh",
	itext 4 "キーボードはHHKB",
	writeImage 0.25 0.65 256 104 "image/hhkb2_croped.png"
	]
