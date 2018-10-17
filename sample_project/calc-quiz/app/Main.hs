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
