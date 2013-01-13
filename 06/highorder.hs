
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

-- Which is the same thing as: 
-- flip' :: (a -> b -> c) -> b -> a -> c
flip' :: (a -> b -> c) -> (b -> a -> c)
flip' f y x = f x y

r8 = flip' zip [1, 2, 3, 4, 5] "hello"
r9 = zipWith (flip' div) [2, 2..] [10, 8, 6, 4, 2]

map' :: (a -> b) -> [a] -> [b]
map' _ [] = []
map' f (x:xs) = f x : map' f xs

r10 = map (+3) [1, 2, 3, 4]
r11 = map (++ "!") ["BANG", "POW", "BIFF"]
r12 = map (replicate 3) [3..6]
r13 = map (map (^2)) [[1,2], [3,4,5,6], [7,8]]
r14 = map fst [(1,2), (3,4), (5,6), (7,8), (9,0)]

filter' :: (a -> Bool) -> [a] -> [a]
filter' _ [] = []
filter' p (x:xs)
	| p x = x : filter' p xs
	| otherwise = filter' p xs

r15 = filter (>3) [1,5,3,2,9,7,8]
r16 = filter (==3) [1,5,3,2,9,7,8]
r17 = filter even [1..10]

quicksort :: (Ord a) => [a] -> [a]
quicksort [] = []
quicksort (x:xs) =
	  let smaller = quicksort (filter (<= x) xs)
	      bigger = quicksort (filter (> x) xs)
	  in smaller ++ [x] ++ bigger

largestDivisible :: (Integral a) => a
largestDivisible = head (filter p [100000, 99999 ..])
		 where p x = x `mod` 3829 == 0

chain :: (Integral a) => a -> [a]
chain 1 = [1]
chain n
      | even n = n:chain (n `div` 2)
      | odd n = n:chain (n * 3 + 1)

listOfFuns = map (*) [0..]
res18 = (listOfFuns !! 4) 5

-- A lambda example. I now this is the same as (+2)
add2 = \x -> x + 2

sum' :: (Num a) => [a] -> a
-- Which is the same as: 
-- sum' = foldl (+) 0
sum' xs = foldl (\acc x -> acc + x) 0 xs

-- dont forget: foldl foldr foldl1 foldr1
-- also: scanl scanr scanl1 scanr1

-- Which is the same as sum (map sqrt [1..30])
res19 = sum $ map sqrt [1..30]
res20 = map ($ 3) [(4+), (10*), (^2), sqrt]

-- 3*(1+ x)
res21 = (1+) . (3*)
res22 = map (negate . abs) [5, -3, -6, 7, -3, 2, -19, 24]
res23 = map (negate . sum . tail) [[1..5], [3..6], [1..7]]

res24 = sum (replicate 5 (max 6.7 8.9))
res25 = sum . replicate 5 . max 6.7 $ 8.9
