data Point
	= Cartesian Double Double
	| Polar Double Double
	deriving Show

getXY :: Point -> (Double, Double)
getXY (Cartesian x y) = (x, y)
getXY (Polar d r) = (d * cos r, d * sin r)

dist :: Point -> Point -> Double
dist p1 p2 = sqrt ((x1 - x2) ^ 2 + (y1 - y2) ^ 2)
	where
	(x1, y1) = getXY p1
	(x2, y2) = getXY p2
