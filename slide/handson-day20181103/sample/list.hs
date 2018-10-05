sumAll :: [Integer] -> Integer
sumAll [] = 0
sumAll (n : ns) = n + sumAll ns
