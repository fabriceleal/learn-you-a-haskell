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

