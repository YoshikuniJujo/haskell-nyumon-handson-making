sum123 :: Integer -> Integer
sum123 0 = 0
sum123 n = sum123 (n - 1) + n
