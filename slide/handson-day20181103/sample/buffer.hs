import System.IO

main :: IO ()
main = do
	bi <- hGetBuffering stdin
	bo <- hGetBuffering stdout
	print bi
	print bo
