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
	prelude, points, future, propaganda, propaganda2, propaganda3,
	thankyou
	]

title :: Page
title = writeTitle "Haskellの概略: 構座" "11. まとめ" :| []

prelude :: Page
prelude = pageTitle "おつかれさまでした" :| [
	text "今日はHaskellの概略を学んだ",
	text "いくつかの文法事項と再帰などの手法を学んだ",
	text "時間の関係で、Haskellらしさを十分には",
	itext 4 "つたえられていないかもしれない"
	]

points :: Page
points = pageTitle "関数と手続き" :| [
	text "「関数」とは引数をあたえられて「式」を作るもの",
	text "「式」は評価されて値になる",
	text "「手続き」は状態を変化させるもの",
	text "ほかの言語では「関数」が「手続き」であり",
	itext 4 "「手続き」が「関数」である",
	text "両者の区別がない",
	text "Haskellでは、「手続き」を「関数」で組み立てて",
	itext 4 "より大きな「手続き」をつくる",
	text "そのようにして、コードを組み立てていく",
	text "組み立てには「IOモナド」という仕組みを使う"
	]

future :: Page
future = pageTitle "この後、何をするか" :| [
	text "今回のレクチャーだけでは",
	itext 4 "十分にHaskellの魅力はつたえられていない",
	text "ただ、はじめの一歩をふみだすことは",
	itext 4 "できたかと思う",
	text "心理的な抵抗を乗りこえる手助けができたなら幸いだ"
	]

propaganda :: Page
propaganda = pageTitle "宣伝" :| [
	text "もう一度、拙書の紹介をする",
	writeImage 0.3 0.25 170 210 "image/cover.png",
	text "「Haskell - 教養としての関数型プログラミング」"
	]

propaganda2 :: Page
propaganda2 = pageTitle "宣伝" :| [
	text "拙書は、自分ながらデキのいい本だと考えている",
	text "手を動かして読み通すことで",
	itext 4 "Haskellによるプログラミングが身につく",
	text "最低限、必要な項目が網羅されているし",
	itext 4 "それぞれの項目について",
	itext 4 "なぜ、その仕組みが必要なのかがわかる例題を",
	itext 4 "提供している",
	text "プログラマの言う「わからない」が",
	itext 4 "多くの場合、「(何の意味があるのか)わからない」",
	itext 4 "なのではないかという仮説を念頭に置いている"
	]

propaganda3 :: Page
propaganda3 = pageTitle "宣伝" :| [
	text "拙書を書いたときは「ハンズオン」という言葉を",
	itext 4 "知らなかったが",
	itext 4 "いま読みかえすと、これは「ハンズオンだな」と",
	text "また、Haskellのいろいろな要素を学ぶときに",
	itext 4 "「ひとつひとつ」学べるように",
	itext 4 "その配置にも気をつかった",
	text "この「教える順序」というだけでも",
	itext 4 "この本には価値があると考えている"
	]

thankyou :: Page
thankyou = pageTitle "ありがとうございました" :| [
	text "このレクチャーを受けていただき",
	itext 4 "ありがとうございました",
	text "みなさまと、お会いできた「縁」を大切に",
	itext 4 "していきたいと思います",
	text "今後もHaskellを学びつづけていただけると幸いです",
	text "何か質問があれば、何でもお知らせください"
	]
