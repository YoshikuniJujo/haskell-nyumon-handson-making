message :: String
message = "Haskellの記述力はァァァァァ世界一ィィィィィ"

stroheim :: IO ()
stroheim = do
	putStrLn "ファイルに保存しますか?(Y/N)"
	s <- getLine
	if s == "Y" || s == "y"
		then writeFile "number_one.txt" (message ++ "\n")
		else putStrLn message
