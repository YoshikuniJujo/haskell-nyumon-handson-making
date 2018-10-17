{-# OPTIONS_GHC -Wall -fno-warn-tabs #-}

module Main where

import System.IO
import System.Random

main :: IO ()
main = putStrLn "Love Haskell"

data Quiz
	= Integer :+: Integer
	| Integer :-: Integer
	| Integer :*: Integer
	deriving Show

instance Random Quiz where
	randomR = undefined
	random g = let
		(a, g') = randomR (0, 100) g
		(b, g'') = randomR (0, 100) g'
		(o, g''') = randomR (0, 2) g''
		q = case o :: Integer of
			0 -> a :+: b
			1 -> a :-: b
			2 -> (a `mod` 10) :*: (b `mod` 10)
			_ -> error "never occur" in
		(q, g''')
