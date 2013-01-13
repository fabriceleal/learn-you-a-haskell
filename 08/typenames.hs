-- record syntax
data Person = Person {
     	    firstName :: String,
	    lastName :: String,
	    age :: Int
     } deriving (Show, Eq, Read)

data ParamType a = ParamType { field :: a } deriving(Show)

tellPerson :: Person -> String
tellPerson (Person { firstName = f, lastName = l, age = a}) = f ++ " " ++ l

data Vector a = Vector a a a deriving (Show)

vplus :: (Num t) => Vector t -> Vector t -> Vector t
(Vector i j k) `vplus` (Vector l m n) = Vector (i+l) (j+m) (k+n)

vectMult :: (Num t) => Vector t -> t -> Vector t
(Vector i j k) `vectMult` s = Vector (i*s) (j*s) (k*s)

scalarMult :: (Num t) => Vector t -> Vector t -> t
(Vector i j k) `scalarMult` (Vector l m n) = i*l+j*m+k*n

fableal = Person { firstName = "Fabrice", lastName = "Leal", age = 23 }
ret1 = fableal == Person { firstName = "Fabrice", lastName = "Leal", age = 23 }
ret2 = show fableal
ret3 = read "Person {firstName = \"Fabrice\", lastName = \"Leal\", age = 23}" :: Person

data Day = Monday | Tuesday | Wednesday | Thursday | Friday | Saturday | Sunday
     deriving (Eq, Ord, Show, Read, Bounded, Enum)


ret4 = Saturday == Saturday
ret5 = Saturday > Friday
ret6 = Tuesday < Sunday
ret7 = Monday `compare` Wednesday
ret8 = minBound :: Day
ret9 = maxBound :: Day
ret10 = succ Thursday
ret11 = pred Saturday
ret12 = [Friday .. Sunday]
ret13 = [minBound .. maxBound] :: [Day]
