
compare100 :: (Num a, Ord a) => a -> Ordering
-- Which is the same thing as:
-- compare100 x = compare 100 x
compare100 = compare 100

divide10 :: (Floating a) => a -> a
divide10 = (/10)

isUpperAlphanum :: Char -> Bool
isUpperAlphanum = (`elem` ['A'..'Z'])

add1 :: Int -> Int
add1 = (+1)

applyTwice :: (a -> a) -> a -> a
applyTwice f x = f (f x)

