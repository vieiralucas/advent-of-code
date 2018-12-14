import qualified Data.Set as S

circular :: [a] -> [a]
circular xs = xs ++ circular xs

parse :: String -> [Integer]
parse = circular . map parseLine . lines
  where
    parseLine ('+' : x) = read x
    parseLine x = read x

solve :: Maybe Integer -> S.Set Integer -> [Integer] -> Integer
solve Nothing sums (x : xs) = solve (Just x) (S.insert x sums) xs
solve (Just sum) sums (x : xs) =
  if S.member newSum sums then newSum
  else solve (Just newSum) (S.insert newSum sums) xs
  where newSum = sum + x

main :: IO ()
main = solve Nothing S.empty <$> parse <$> readFile "input.txt" >>= (putStrLn . show)

