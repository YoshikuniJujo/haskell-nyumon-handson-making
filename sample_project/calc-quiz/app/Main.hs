{-# OPTIONS_GHC -Wall -fno-warn-tabs #-}

module Main where

import System.IO
import System.Random

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

showQuiz :: Quiz -> String
showQuiz (a :+: b) = show a ++ " + " ++ show b ++ " = "
showQuiz (a :-: b) = show a ++ " - " ++ show b ++ " = "
showQuiz (a :*: b) = show a ++ " * " ++ show b ++ " = "

answer :: Quiz -> Integer
answer (a :+: b) = a + b
answer (a :-: b) = a - b
answer (a :*: b) = a * b

quiz1 :: IO Bool
quiz1 = do
	q <- randomIO
	putStr $ showQuiz q
	hFlush stdout
	a <- getLine
	let	r = read a == answer q
	putStrLn $ if r then "正解!!" else "残念..."
	return r

quiz :: Integer -> Integer -> IO Integer
quiz n p
	| n < 1 = return p
	| otherwise = do
		r <- quiz1
		quiz (n - 1) (if r then p + 1 else p)

main :: IO ()
main = do
	p <- quiz 10 0
	putStrLn $ show p ++ "/10"
