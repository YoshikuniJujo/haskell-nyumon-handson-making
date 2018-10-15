import Data.Time

currentTime :: IO ()
currentTime = do
	putStrLn "現在時刻を取得します"
	now <- getCurrentTime
	putStrLn "ファイルに保存しますか?(Y/N)"
	s <- getLine
	if s == "Y" || s == "y"
		then writeFile "currentTime.txt" (show now ++ "\n")
		else putStrLn (show now)
