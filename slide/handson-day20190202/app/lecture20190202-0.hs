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
	prelude, qiita,
	selfIntroduction1, selfIntroduction2, selfIntroduction3,
	selfIntroduction4, selfIntroduction5, selfIntroduction6,
	selfIntroduction7,
	aboutHaskell0_00, aboutHaskell0_0, aboutHaskell0_1,
	aboutHaskell0_2, aboutHaskell1, aboutHaskell2, aboutHaskell3,
	aboutHaskell4, aboutHaskell5, aboutHaskell6,
	aboutHaskell9, aboutHaskell10,
	aboutHandson1, aboutHandson2, aboutHandson3, aboutHandson4
	]

title :: Page
title = writeTitle "Haskellの概略: 講座" "0. はじめに" :| []

prelude :: Page
prelude = pageTitle "ごあいさつ" :| [
	text "おあつまりいただき、ありがとうございます",
	writeImage 0.3 0.25 170 210 "image/cover.png",
	text "「Haskell - 教養としての関数型プログラミング」の",
	itext 20 "著者です"
	]

qiita :: Page
qiita = pageTitle "オンライン" :| [
	text "今日の内容は以下のURLで、オンラインで閲覧可能です",
	itext 4 "https://bit.ly/2Rr5tyO",
	itext 4 "(に、あーる、あーる、ご、てぃー、わい、おー)"
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
	text "なのでHaskell歴16年だ",
	text "ちなみにOSは2002年からGentooを使っている",
	text "なのでGentoo歴は17年ということになる"
	]

selfIntroduction4 :: Page
selfIntroduction4 = pageTitle "自己紹介" :| [
	text "だいたい、つぎのようになる",
	itext 4 "Haskell歴 16年",
	itext 4 "Gentoo歴 17年",
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
	itext 4 "カフェラテを飲んでいる",
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
	writeImage 0.30 0.25 271.1 151.1 "image/coffeebeans_croped.png",
	text "このときの豆はCOEプログレッソ農園",
	text "COEとはカップ・オブ・エクセレンスのこと",
	text "品評会で高く評価された豆"
	]

aboutHaskell0_00 :: Page
aboutHaskell0_00 = pageTitle "Haskellとは" :| [
	text "今日は「Haskellの概略」ということで",
	itext 4 "Haskellを学んでいく"
	]

aboutHaskell0_0 :: Page
aboutHaskell0_0 = pageTitle "Haskellとは" :| [
	text "Haskellを学ぶのは楽しい",
	text "Haskellでコードを書くのは楽しい",
	text "Haskellでコードを書くとき、安心感がある",
	text "Haskellを学ぶ理由として",
	itext 4 "それだけでも十分かなと思う",
	text "Haskellは手になじむ道具だ",
	text "実際にあるていど学ぶことで",
	itext 4 "その楽しさや安心感がわかると思う",
	text "「Haskellのよさ」はこの感覚だ",
	text "この感覚をつたえることは難しい",
	text "でも、不十分ながらも",
	itext 4 "Haskellの何がいいのかを説明してみよう"
	]

aboutHaskell0_1 :: Page
aboutHaskell0_1 = pageTitle "Haskellとは" :| [
	text "Haskellの、どこがいいのだろうか",
	itext 4 "* 安心感",
	itext 4 "* 適切な抽象化による二重化の回避",
	itext 4 "* ムダのない文法",
	text "そのあたりだろうか"
	]

aboutHaskell0_2 :: Page
aboutHaskell0_2 = pageTitle "Haskellとは" :| [
	text "Haskellは、どんな言語だろうか",
	text "実際に書くまえに、言語を紹介するのはむずかしい",
	text "ここでは「手続き」と「関数」というキーワードで",
	itext 4 "説明していく"
	]

aboutHaskell1 :: Page
aboutHaskell1 = pageTitle "Haskellとは" :| [
	text "「手続き」とはメモリなどの「状態」を変化させるもの",
	text "「手続き」は「実行」されて、結果として状態が変化する",
	text "",
	text "「関数」は「引数」をあたえられて「式」になる",
	text "「式」は「評価」されて「値」になる",
	text "",
	text "多くの言語で「手続き」と「関数」は、わけられていない"
	]

aboutHaskell2 :: Page
aboutHaskell2 = pageTitle "Haskellとは" :| [
	text "たとえば、つぎのような(Rubyの)コードを考える",
	itext 4 "$number = 123",
	itext 4 "",
	itext 4 "def add3(x)",
	itext 4 "        $number += 321",
	itext 4 "        return(x + 3)",
	itext 4 "end",
	text "このメソッドadd3は「状態を変化させる」ので",
	itext 4 "「手続き」であると考えられる",
	text "しかしadd3(5)は評価されて8になるという点で",
	itext 4 "このメソッドは「関数」であるとも言える"
	]

aboutHaskell3 :: Page
aboutHaskell3 = pageTitle "Haskellとは" :| [
	text "このように、「手続き」のようでもあり",
	itext 4 "「関数」のようでもあるナニカ",
	text "そのナニカが、ほとんどの言語において",
	itext 4 "処理の記述に使われている",
	text "このナニカの問題は「関数」とはちがって",
	itext 4 "単純な「置き換え」で理解できないことだ",
	text "コードのなかのadd3(5)を",
	itext 4 "8に置き換えることはできない",
	text "これは「コードが何を意味するのか」を",
	itext 4 "簡単には把握できないことを意味する"
	]

aboutHaskell4 :: Page
aboutHaskell4 = pageTitle "Haskellとは" :| [
	text "Haskellでは「関数」と「手続き」とは",
	itext 4 "きちんとわけられている",
	text "「関数」は状態を変化させないし",
	itext 4 "状態の影響をうけない",
	text "「手続き」は「関数」の引数になり",
	itext 4 "返り値にもなる",
	text "つまり、Haskellでは「手続き」は",
	itext 4 "ほかの「値」とおなじように",
	itext 4 "関数によって処理されるモノだ"
	]

aboutHaskell5 :: Page
aboutHaskell5 = pageTitle "Haskellとは" :| [	
	text "ほかの言語では「状態変化」が頻繁に使われる",
	text "「状態」は時間の関数であり",
	itext 4 "タイミングによって変化してしまう",
	text "あつかいずらいものだ",
	text "必要のないところで「状態変化」を使うことは",
	itext 4 "ムダに話を複雑にしてしまう"
	]

aboutHaskell6 :: Page
aboutHaskell6 = pageTitle "Haskellとは" :| [
	text "Haskellのよさを言葉にするのはむずかしい",
	text "実際にコードを書くまで、わからないところがある",
	text "Haskellを学ぶことで、ほかの言語を使ったとしても",
	itext 4 "よりきれいで安全な書きかたをするクセがつく",
	text "高度な抽象化が可能なので",
	itext 4 "コードの二重化などを避けることができる",
	itext 4 "ムダのない気持ちの良いコードが書ける"
	]

aboutHaskell9 :: Page
aboutHaskell9 = pageTitle "Haskellの実際" :| [
	text "Haskellって実際に使われてるの?",
	text "使われてますよ",
	itext 4 "* Facebook (SNS)",
	itext 4 "* NTTデータ(データ通信、システム構築)",
	itext 4 "* ASAHIネット (プロバイダ)",
	itext 4 "* Tsuru Capital (高頻度取引)",
	text "それぞれ",
	itext 4 "* スパム対策",
	itext 4 "* COBOL資産の分析",
	itext 4 "* 認証サーバ",
	itext 4 "* 全般",
	text "といった用途で使われています"
	]

aboutHaskell10 :: Page
aboutHaskell10 = pageTitle "Haskellの実際" :| [
	text "「既存のライブラリを使えばすむ」のではなく",
	itext 4 "それぞれの問題にあわせた解決が必要なとき",
	itext 4 "「複雑さ」を制御しながら解を組み立てていく",
	text "そのような場面がHaskellに向いていると感じる",
	text "",
	text "また、Tsuru Capitalでは",
	itext 4 "「Haskellを使えば優秀な人材が集まる」",
	itext 4 "といった戦略もあった、とか"
	]

aboutHandson1 :: Page
aboutHandson1 = pageTitle "このハンズオンについて" :| [
	text "今日のハンズオンでは「Haskellにふれる」",
	text "はじめのうちは対話環境で",
	itext 4 "式の打ち込みと結果の表示を試す",
	text "また、演習として課題のコードを書いてもらい",
	itext 4 "模範解答の解説をおこなう"
	]

aboutHandson2 :: Page
aboutHandson2 = pageTitle "このハンズオンについて" :| [
	text "時間に限りがあるので",
	itext 4 "すべてを説明することはできない",
	text "できるだけ理解しやすいようにと考えた",
	text "自分でちょっとしたコードを書けるように",
	text "Haskellの魅力は十分にはつたえられないかも",
	text "Haskellは難しいことをやるときに、より力を発揮する"
	]

aboutHandson3 :: Page
aboutHandson3 = pageTitle "注意点" :| [
	text "個人的なポリシーとして字下げはタブ文字を使う",
	text "タブは8タブとする",
	text "Haskellのコミュニティでは「タブは使わない」という",
	itext 4 "エチケットがあるようだ",
	text "僕は個人的にタブ(8タブ)を使うし",
	itext 4 "仲間が増えればいいとも思うけど",
	itext 4 "Haskellerとしては異端であることを",
	itext 4 "おつたえしておく必要がある"
	]

aboutHandson4 :: Page
aboutHandson4 = pageTitle "凡例" :| [
	text "シェルへの入力を、つぎのように示す",
	itext 4 "% command",
	text "対話環境への入力を、つぎのように示す",
	itext 4 "> foo bar",
	itext 4 "baz",
	text "これは対話環境にfoo barを入力してエンターキーを押すと",
	itext 4 "結果としてbazが表示されるということ",
	text "ファイルへの書き込みを、つぎのように示す",
	itext 4 "% vim file_name.hs",
	itext 4 "main = putStrLn \"I love Haskell!\"",
	text "これはファイルfile_name.hsにI love Haskellを",
	itext 4 "(新規に、または追加で)書き込むということ",
	text "エディタを代表してVimで示している"
	]
