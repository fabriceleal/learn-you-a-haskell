
removeNonUppercase :: [Char] -> [Char]
removeNonUppercase st = [c | c <- st, c `elem` ['A' .. 'Z']]

addThree :: Int -> Int -> Int -> Int
addThree x y z = x + y + z

-- TYPES:
-- Int: fixed size
-- Integer: arbitrary size
-- Float
-- Double
-- Bool
-- Char


-- TYPECLASSES:
-- Eq: interface for equalities (ex: ==)
-- Ord: " for ordering (ex: >)
-- Show: " for representing stuff as strings (ex: show)
-- Read: " for parsing strings as stuff (ex: read)
-- Enum: " for sequentially ordered types
-- Bounded: " for stuff with lower and upper bounds
-- Num : " for stuff that behaves like numbers (Integrals + Floatings) (check: *)
-- Integral: only integral numbers: Int, Integer
-- Floating: only floating point numbers: Double, Float

x1 = read "5" :: Int
y1 = read "(5, 'a')" :: (Int, Char)

-- fromIntegral: convert from Integral to Num

