
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

r1 = applyTwice (++ "B") "A"
r2 = applyTwice ("A" ++) "B"
r3 = applyTwice (3:) [1]

zipWith' :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWith' _ [] _ = []
zipWith' _ _ [] = []
zipWith' f (x:xs) (y:ys) = f x y : zipWith' f xs ys

r4 = zipWith' (+) [1,2,3] [4,5,6]

f :: a -> b -> (a, b)
f a b = (a, b)

r5 = zipWith' (+) [1,2,3] [4,5,6]
r6 = zipWith' f [1,2,3] [4,5,6]
r7 = zipWith' (++) ["joy ", "sonic ", "massic "] ["division", "youth", "attack"]

-- Which is the same thing as flip' :: (a -> b -> c) -> b -> a -> c
flip' :: (a -> b -> c) -> (b -> a -> c)
flip' f y x = f x y

r8 = flip' zip [1, 2, 3, 4, 5] "hello"
r9 = zipWith (flip' div) [2, 2..] [10, 8, 6, 4, 2]
