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
	selfIntroduction4, selfIntroduction5, selfIntroduction6,
	selfIntroduction7,
	aboutHaskell0,
	aboutHaskell1, aboutHaskell2, aboutHaskell3, aboutHaskell4,
	aboutHaskell5, aboutHaskell6, aboutHaskell7, aboutHaskell8,
	aboutHaskell9,
	aboutHandson1
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
	text "* 時代の波に乗れず消えていってしまう"
	]

selfIntroduction2 :: Page
selfIntroduction2 = pageTitle "自己紹介" :| [
	text "MSXにはROM上にBASICが内蔵されていた",
	text "BASIC言語によるプログラミングは、つぎのような感じ",
	text "",
	itext 5 "10 REM 5つ数える(\"3\"だけ飛ばす)",
	itext 5 "20 FOR I = 1 TO 5",
	itext 5 "25 IF I = 3 THEN GOTO 40",
	itext 5 "30 PRINT I",
	itext 5 "40 NEXT",
	itext 5 "RUN",
	itext 5 "",
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

selfIntroduction5 :: Page
selfIntroduction5 = pageTitle "自己紹介" :| [
	text "最近は、すこしだけ、コーヒーにこっている",
	text "毎朝エスプレッソを抽出して",
	itext 4 "カフェラテ(カプチーノ?)を飲んでいる",
	writeImage 0.30 0.40 192 186 "image/cafelatte_croped.png"
	]

selfIntroduction6 :: Page
selfIntroduction6 = pageTitle "自己紹介" :| [
	text "愛用のグラインダーと",
	itext 2 "エスプレッソマシン",
	writeImage 0.50 0.19 189 276 "image/machine_croped.png"
	]

selfIntroduction7 :: Page
selfIntroduction7 = pageTitle "自己紹介" :| [
	text "焙煎用の網で自家焙煎も",
	writeImage 0.30 0.25 271.1 151.1 "image/coffeebeans2_croped.png",
	text "このときの豆はブラジル サンアントニオ ショコラ",
	itext 4 "ナッツ系の香り、ほのかな甘味",
	itext 4 "すっきりとした口当たり",
	itext 4 "...らしい、「なんとなく、わかる」",
	text "細かい味のちがいはわからないが「おいしい」"
	]

aboutHaskell0 :: Page
aboutHaskell0 = pageTitle "Haskellとは" :| [
	text "今日は「Haskell入門ハンズオン!」ということで",
	itext 4 "Haskellを学んでいく",
	text "ざっくりとHaskellを紹介する",
	text "実際に書くまえに、言語を紹介するのはむずかしい",
	text "「Haskellは、すなおで、ふつう」",
	text "このあとの「Haskellの紹介」に関しては",
	itext 4 "これだけ覚えていただければいい",
	text "ハンズオンの本編で、きちんと学ぶので"
	]

aboutHaskell1 :: Page
aboutHaskell1 = pageTitle "Haskellとは" :| [
	text "Haskellとは何か、どんな言語なのか",
	text "僕に言わせれば",
	itext 1 "「もっとも、すなおで、ふつうなプログラミング言語」",
	text "たとえば",
	itext 4 "x = 3",
	itext 4 "...",
	itext 4 "y = x + 9",
	itext 4 "z = x * x + 2",
	text "のようなとき、どのxも3で置き換えることができる",
	text "ほかの多くの言語では「...」のところを",
	itext 4 "じっくり読まないと、xの値を決定できない"
	]

aboutHaskell2 :: Page
aboutHaskell2 = pageTitle "Haskellとは" :| [
	text "たとえば関数をリストにいれて",
	itext 4 "f1 x y = x + y; f2 x y = x - y",
	itext 4 "fs = [f1, f2]",
	itext 4 "z = (head fs) 3 4",
	text "のようにもできる",
	text "関数headでリストfsの先頭(f1)を取り出して",
	itext 4 "それに対して引数3と4をあたえている",
	text "関数も値とおなじようにリストへの出し入れができる",
	text "リストに入れるときも、出して使うときも",
	itext 4 "とくに特別な操作は必要ない"
	]

aboutHaskell3 :: Page
aboutHaskell3 = pageTitle "Haskellとは" :| [
	text "入出力に関しても同様だ",
	itext 4 "io1 = putStrLn \"hello\"; io2 = putStrLn \"world\"",
	itext 4 "ios = [io1, io2]",
	itext 4 "main = head ios",
	text "「putStrLn \"hello\"」にラベルmainをつけたということ",
	text "mainを実行すると端末に\"hello\"と表示される",
	text "",
	text "つぎのような「すなおさ」がある",
	itext 4 "* 1度、定義された値は変化しない",
	itext 4 "* 関数も入出力も、リストへの出し入れが可能"
	]

aboutHaskell4 :: Page
aboutHaskell4 = pageTitle "Haskellとは" :| [
	text "プログラミングとは",
	itext 4 "処理を組み立てていくこと",
	text "Haskellでは処理を組み合わせるときの",
	itext 4 "その組み合わせかたが、非常に「すなお」だ",
	text "",
	text "コードの上下で「時間の流れ」を表していない",
	itext 4 "* Haskell以外の言語の多くはコードの流れで",
	itext 8 "時間の流れを表現している",
	itext 4 "* 結果として、動き続ける的をねらうことになる",
	text "Haskellを使うと、コードを書くのも保守するのも、楽に"
	]

aboutHaskell5 :: Page
aboutHaskell5 = pageTitle "Haskellとは" :| [
	text "多くの言語では",
	itext 2 "書かれたコードのなかに「時間の流れ」が入りこむ",
	itext 2 "「時間の流れ」によって状態が変化してしまう",
	text "この「状態変化」というものが保守を困難にする",
	text "たとえば、つぎのようなC言語のコードがあったとする",
	itext 4 "x = 123;",
	itext 4 "some_function();",
	itext 4 "y = x + 3;",
	text "値xはsome_functionの実行で変化しているかもしれない",
	text "yの値は126にはならない可能性がある",
	text "これは「動く的をねらう」という作業になりやすい"
	]

aboutHaskell6 :: Page
aboutHaskell6 = pageTitle "Haskellとは" :| [
	text "マーズ・クライメイト・オービター",
	writeImage 0.70 0.10 120 145 "image/mars_climate_orbiter_croped.png",
	text "火星探査機",
	text "火星上空140-150kmの軌道に乗るはずが",
	text "高度57kmの軌道に乗ってしまったため炎上",
	text "147億円の損失"
	]

aboutHaskell7 :: Page
aboutHaskell7 = pageTitle "Haskellとは" :| [
	text "原因は?",
	text "単位の食いちがい",
	itext 4 "地上から送信したデータはヤード・ポンド法",
	itext 4 "機内の制御ではメートル法を使用",
	text "Haskellは静的型付け言語",
	text "型を適切に使用すれば、ふせげたかも",
	itext 4 "data PoundForce = PF Double",
	itext 4 "data Newton = Nt Double",
	itext 4 "getPF :: IO PoundForce",
	itext 4 "useNewton :: Newton -> IO ()",
	text "このようにしておけばgetPFで取得した値を",
	itext 4 "useNewtonで使用しようとしても型エラーになる"
	]

aboutHaskell8 :: Page
aboutHaskell8 = pageTitle "Haskellとは" :| [
	text "Haskellはコードのなかに暗黙の時間の流れがない",
	itext 4 "暗黙の時間の流れはコードをごちゃごちゃにする",
	text "静的型付けによって守られている",
	itext 4 "(同時に多相型による柔軟性も持つ)",
	text "",
	text "=> 整理された形でコードを書くことができる",
	text "=> コードの保守が楽になる"
	]

aboutHaskell9 :: Page
aboutHaskell9 = pageTitle "Haskellの実際" :| [
	text "Haskellって実際に使われてるの?",
	text "使われてますよ",
	itext 4 "* Facebook (SNS)",
	itext 4 "* ASAHIネット (プロバイダ)",
	itext 4 "* Tsuru Capital (高頻度取引)",
	text "それぞれ",
	itext 4 "* スパム対策",
	itext 4 "* 認証サーバ",
	itext 4 "* 全般",
	text "といった用途で使われています"
	]

aboutHandson1 :: Page
aboutHandson1 = pageTitle "このハンズオンについて" :| [
	]
