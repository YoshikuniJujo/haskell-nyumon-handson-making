io1 :: IO ()
io1 = do
	putStrLn "hello"
	s <- getLine
	putStrLn s

io2 :: IO ()
io2 = do
	n <- getLine
	let	msg = "Hello, " ++ n ++ "!"
	putStrLn msg
