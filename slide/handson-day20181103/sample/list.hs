sumAll :: [Integer] -> Integer
sumAll [] = 0
sumAll (n : ns) = n + sumAll ns

myMap :: (a -> b) -> [a] -> [b]
myMap _ [] = []
myMap f (x : xs) = f x : myMap f xs

myFilter :: (a -> Bool) -> [a] -> [a]
myFilter _ [] = []
myFilter p (x : xs)
	| p x = x : myFilter p xs
	| otherwise = myFilter p xs

(.++) :: [a] -> [a] -> [a]
(x : xs) .++ ys = x : (xs .++ ys)
[] .++ ys = ys
