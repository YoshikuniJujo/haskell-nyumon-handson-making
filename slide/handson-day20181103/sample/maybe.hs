safeDiv :: Integer -> Integer -> Maybe Integer
safeDiv _ 0 = Nothing
safeDiv a b = Just (a `div` b)

addToMaybe :: Maybe Integer -> Integer -> Maybe Integer
addToMaybe Nothing _ = Nothing
addToMaybe (Just a) b = Just (a + b)
