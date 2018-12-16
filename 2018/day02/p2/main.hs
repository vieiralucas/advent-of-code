-- problem: https://adventofcode.com/2018/day/2

import Data.List
import Data.Maybe

distance :: String -> String -> Int
distance s1 s2 = length $ (sort s1) \\ (sort s2)

diff :: String -> String -> String
diff s = filter (flip elem s)

distanceIs1 s1 = (== 1) . distance s1

solve :: [String] -> Either String String
solve [] = Left "no solution"
solve (x : xs) =
  fromMaybe (solve xs) $ Right . diff x <$> find (distanceIs1 x) xs

main :: IO ()
main = solve <$> lines <$> readFile "input.txt" >>= (putStrLn . show)
