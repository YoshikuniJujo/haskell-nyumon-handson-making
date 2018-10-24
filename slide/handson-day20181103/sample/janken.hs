import System.Random

data Janken = Rock | Paper | Scissors deriving Show

instance Random Janken where
	randomR = undefined
	random g = let (n, g') = next g in
		case n `mod` 3 of
			0 -> (Rock, g')
			1 -> (Paper, g')
			2 -> (Scissors, g')
