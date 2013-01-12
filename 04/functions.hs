-- Use something like (...) => ...
-- to use constraints

lucky :: (Integral a) => a -> String
lucky 7 = "Lucky number 7!"
lucky _ = "Call me with 7!"

sayme :: (Integral a) => a -> String
sayme 1 = "one"
sayme 2 = "two"
sayme 3 = "three"
sayme 4 = "four"
sayme 5 = "five"
sayme _ = "not between one and four..."

factorial :: (Integral a) => a -> a
factorial 0 = 1
factorial x = x * factorial (x - 1)

addVectors :: (Num a) => (a, a) -> (a, a) -> (a, a)
addVectors (a1, a2) (b1, b2) = (a1 + b1, a2 + b2)

oneOfTriple :: (a, b, c) -> a
oneOfTriple (f, _, _) = f

twoOfTriple :: (a, b, c) -> b
twoOfTriple (_, s, _) = s

threeOfTriple :: (a, b, c) -> c
threeOfTriple (_, _, t) = t

xs = [(1,3), (2,4), (5,6)]
res = [a+b | (a,b) <- xs]

head' :: [a] -> a
head' [] = error "No head for an empty list"
head' (x:_) = x

length' :: (Num b) => [a] -> b
length' [] = 0
length' (_:xs) = 1 + length' xs

bmiTell :: (RealFloat a) => a -> String
bmiTell bmi
	| bmi <= 18.5 = "You're underweight!"
	| bmi <= 25.0 = "You're normal!"
	| bmi <= 30.0 = "You're fat!"
	| otherwise   = "You're a whale!"

max' :: (Ord a) => a -> a -> a
max' x y
     | x > y = x
     | otherwise = y

myCompare :: (Ord a) => a -> a -> Ordering
a `myCompare` b
  | a > b = GT
  | a < b = LT
  | otherwise = EQ

bmiTell' :: (RealFloat a) => a -> a -> String
bmiTell' weight height
	| bmi <= skinny = "You're underweight!"
	| bmi <= normal = "You're normal!"
	| bmi <= fat = "You're fat!"
	| otherwise   = "You're a whale!"
	 where bmi = weight / height ^ 2
	       (skinny, normal, fat) = (18.5, 25.0, 30.0)

cylinder :: (RealFloat a) => a -> a -> a
cylinder r h =
	 let sideArea = 2 * pi * r * h
	     topArea = pi * r ^ 2
	 in sideArea + 2 * topArea

res2 = (let a = 100; b = 200; c = 300 in a * b * c)

head'' :: [a] -> a
head'' xs = case xs of [] -> error "No head for an empty list!"
       	    	       (x:_) -> x
