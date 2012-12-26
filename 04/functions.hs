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

