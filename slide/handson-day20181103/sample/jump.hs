import Control.Monad
import Control.Concurrent
import Data.Foldable

main :: IO ()
main = for_ [0, 3, 4, 4, 3, 0] $ \h -> do
	put h
	threadDelay 100000

put :: Int -> IO ()
put h = do
	replicateM_ (30 - h) $ putStrLn ""
	putStrLn "*"
	replicateM_ h $ putStrLn ""
