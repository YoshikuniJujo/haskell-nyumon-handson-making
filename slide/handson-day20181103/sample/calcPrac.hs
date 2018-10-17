{-# OPTIONS_GHC -Wall -fno-warn-tabs #-}

import System.Random

data Quiz
	= Integer :+: Integer
	| Integer :-: Integer
	| Integer :*: Integer
	deriving Show

instance Random Quiz where
	randomR = error "foobar"
	random g = let
		(a, g') = randomR (0, 100) g
		(b, g'') = randomR (0, 100) g'
		(o, g''') = randomR (0, 2) g''
		q = case o :: Integer of
			0 -> a :+: b
			1 -> a :-: b
			2 -> (a `mod` 10) :*: (b `mod` 10) in
		(q, g''')

showQuiz :: Quiz -> String
showQuiz (a :+: b) = show a ++ " + " ++ show b ++ " = "
showQuiz (a :-: b) = show a ++ " - " ++ show b ++ " = "
showQuiz (a :*: b) = show a ++ " * " ++ show b ++ " = "

answer :: Quiz -> Integer
answer (a :+: b) = a + b
answer (a :-: b) = a - b
answer (a :*: b) = a * b

main :: IO ()
main = quiz 10

quiz :: Integer -> IO ()
quiz n	| n < 1 = return ()
	| otherwise = quiz1 >> quiz (n - 1)

quiz1 :: IO ()
quiz1 = do
	q <- randomIO
	putStr $ showQuiz q
	a <- getLine
	putStrLn $ if read a == answer q then "正解!!" else "残念..."