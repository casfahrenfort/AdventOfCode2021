import System.IO
import Control.Monad
import Data.Char(digitToInt)
import Data.List.Split

data Command = 
    Forward Int |
    Depth Int  

main = do  
        contents <- readFile "2.txt"
        print (f 0 0 0 (map readCommand . lines $ contents))

f :: Int -> Int -> Int -> [Command] -> Int
f h d a [] = h * d
f h d a ((Forward x):xs) = f (h+x) (d+a*x) a xs
f h d a ((Depth x):xs) = f h d (a+x) xs

readCommand :: String -> Command
readCommand s@('f':xs) = Forward (readNr s)
readCommand s@('d':xs) = Depth (readNr s)
readCommand s@('u':xs) = Depth (-(readNr s))

readNr :: String -> Int
readNr s = read $ last $ splitOn " " s :: Int