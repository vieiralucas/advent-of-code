import Data.List

containsN :: Int -> String -> Bool
containsN n = elem n . map length . groupBy (\a b -> a == b) . sort

contains2 :: String -> Bool
contains2 = containsN 2

contains3 :: String -> Bool
contains3 = containsN 3

solve :: [String] -> Int
solve s = uncurry (*) $ foldr solve' (0, 0) s
  where
    solve' s (twos, threes) = case (contains2 s, contains3 s) of
      (True, True)  -> (twos + 1, threes + 1)
      (True, False) -> (twos + 1, threes    )
      (False, True) -> (twos    , threes + 1)
      (_, _)        -> (twos    , threes    )

main :: IO ()
main = solve <$> lines <$> readFile "input.txt" >>= (putStrLn . show)
