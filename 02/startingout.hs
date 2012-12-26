-- Function with one argument
doubleMe x = x + x

-- Function with two arguments
doubleUs x y = x*2 + y*2

-- Function with if
doubleSmallNumber x = if x > 100
		      then x
		      else x*2

-- if is an expression!
doubleSmallNumberAndAddOne x = (if x > 100 then x else x*2) + 1

-- in the ghci, you would need to do: 
--    let aListOfNumbers = [1,2,3,4,5]
aListOfNumbers = [1,2,3,4,5]

-- Adding lists
anotherListOfNumbers = [1,2,3] ++ [4,5,6]

-- Strings are lists
aString = "hello" ++ " " ++ "world"

-- Cons'ing
consingTakeOne = 'A':' ':"SMALL CAT"
consingTakeTwo= 1:[2,3,4]

-- Indexing
indexTakeOne = "Steve Buscemi" !! 6
indexTakeTwo = [1,2,3,4,5] !! 0

-- Usefull functions: 
-- head, tail, last, init
-- length, null
-- reverse, take, drop
-- maximum, minimum
-- sum, product
-- elem

-- Ranges
oneToTwenty = [1..20]
letters = ['a'..'z']

-- Range with step
evens = [2,4..20]

-- Possible funky range
funky = [0.1, 0.3 .. 1]

-- Infinite list
-- see also repeat
infiniteTaked = take 12 (cycle "LOL")


-- List comprehension
doublesOneToTen = [x*2 | x <- [1 .. 10]]

doublesOneToTenThenGreaterThanTwelve = [x*2 | x <- [1 .. 10], x*2 >= 12]

fiftenToHundredRemainOfDivBySevenIsThree = [x | x <- [50 .. 100], x `mod` 7 == 3 ]

boomBangs xs = [if x < 10 then "BOOM!" else "BANG!" | x <- xs, odd x]

severalLists = [x*y | x <- [1..5], y <- [6..10], x * y > 20]

-- Length using list comprehension
length' xs = sum [1 | _ <- xs]

-- String manipulation using list comprehension
removeNonUpper st = [x | x <- st, x `elem` ['A'..'Z'] ]

-- List comprehensions on nested lists
theNestedList = [[2,4,7,5], [2,3,6,1], [5,8,2,4]]
theNestedListEvens = [[x | x <- xs, even x] | xs <- theNestedList]

-- Tuples
-- For pairs: fst, snd
-- zip

zipped = zip [1,2,3,4,5] [6,7,8,9,10]

triangles = [(a,b,c) | c <- [1..10], b <- [1..c], a <- [1..b], a + b + c == 24, a^2 + b^2 == c^2 ]
