import qualified Data.Map as Map

-- record syntax
data Person = Person {
     	    firstName :: String,
	    lastName :: String,
	    age :: Int
     } deriving (Show, Eq, Read)

data ParamType a = ParamType { field :: a } deriving(Show)

tellPerson :: Person -> String
tellPerson (Person { firstName = f, lastName = l, age = a}) = f ++ " " ++ l

-- ***

data Vector a = Vector a a a deriving (Show)

vplus :: (Num t) => Vector t -> Vector t -> Vector t
(Vector i j k) `vplus` (Vector l m n) = Vector (i+l) (j+m) (k+n)

vectMult :: (Num t) => Vector t -> t -> Vector t
(Vector i j k) `vectMult` s = Vector (i*s) (j*s) (k*s)

scalarMult :: (Num t) => Vector t -> Vector t -> t
(Vector i j k) `scalarMult` (Vector l m n) = i*l+j*m+k*n

-- ***

fableal = Person { firstName = "Fabrice", lastName = "Leal", age = 23 }
ret1 = fableal == Person { firstName = "Fabrice", lastName = "Leal", age = 23 }
ret2 = show fableal
ret3 = read "Person {firstName = \"Fabrice\", lastName = \"Leal\", age = 23}" :: Person

-- ***

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

-- ***

type PhoneNumber = String
type Name = String
type AssocList k v = [(k, v)]
type PhoneBook = AssocList Name PhoneNumber

inPhoneBook :: Name -> PhoneNumber -> PhoneBook -> Bool
inPhoneBook name pnumber pbook = (name, pnumber) `elem` pbook

-- ***

--data Either a b = Left a | Right b deriving (Eq, Ord, Read, Show)

-- ***

data LockerState = Taken | Free deriving (Show, Eq)

type Code = String

type LockerMap = Map.Map Int (LockerState, Code)

lockerLookup :: Int -> LockerMap -> Either String Code
lockerLookup lockerNumber map =
	     case Map.lookup lockerNumber map of
	     	  Nothing -> Left $ "Locker number " ++ show lockerNumber ++ " doesnt exist!"
		  Just (state, code) -> if state /= Taken
		       	       	     	then Right code
					else Left $ "Locker " ++ show lockerNumber ++ " is already taken!"

lockers :: LockerMap
lockers = Map.fromList
	[(100, (Taken, "ZD39I"))
	,(101, (Free, "JAH3I"))
	,(103, (Free, "IQSA9"))
	,(105, (Free, "QOTSA"))
	,(109, (Free, "893JJ"))
	,(110, (Free, "99292"))
	]


--data List a = Empty | Cons a (List a) deriving (Show, Read, Eq, Ord)
infixr 5 :-:
data List a = Empty | a :-: (List a) deriving (Show, Read, Eq, Ord)

infixr 5 .++
(.++) :: List a -> List a -> List a
Empty .++ ys = ys
(x :-: xs) .++ ys = x :-: (xs .++ ys)

a = 4 :-: 5 :-: 6 :-: Empty
b = 7 :-: 8 :-: 9 :-: Empty
c = a .++ b

-- ***

data Tree a = EmptyTree | Node a (Tree a) (Tree a) deriving (Show, Read, Eq)

singleton :: a -> Tree a
singleton x = Node x EmptyTree EmptyTree

treeInsert :: (Ord a) => a -> Tree a -> Tree a
treeInsert x EmptyTree = singleton x
treeInsert x (Node a left right)
	   | x == a = Node x left right
	   | x < a  = Node a (treeInsert x left) right
	   | x > a  = Node a left (treeInsert x right)

treeElem :: (Ord a) => a -> Tree a -> Bool
treeElem x EmptyTree = False
treeElem x (Node a left right)
	 | x == a = True
	 | x < a  = treeElem x left
	 | x > a  = treeElem x right

nums = [8, 6, 4, 1, 7, 3, 5]
numsTree = foldr treeInsert EmptyTree nums
have3 = 3 `treeElem` numsTree
have10 = 10 `treeElem` numsTree

-- ***

class MyEq a where
      (.==) :: a -> a -> Bool
      (./=) :: a -> a -> Bool
      x .== y = not (x ./= y)
      x ./= y = not (x .== y)

data TrafficLight = Red | Yellow | Green

instance MyEq TrafficLight where
	 Red .== Red = True
	 Green .== Green = True
	 Yellow .== Yellow = True
	 _ .== _ = False

instance Show TrafficLight where
	 show Red = "shtap!"
	 show Green = "go!"
	 show Yellow = "easy there!"

instance (Eq m) => MyEq (Maybe m) where
	 Just x .== Just y = x == y
	 Nothing .== Nothing = True
	 _ .== _ = False

-- ***

class YesNo a where
      yesno :: a -> Bool

instance YesNo Int where
	 yesno 0 = False
	 yesno _ = True

instance YesNo [a] where
	 yesno [] = False
	 yesno _ = True

instance YesNo Bool where
	 yesno = id

instance YesNo (Maybe a) where
	 yesno (Just _) = True
	 yesno Nothing = False

instance YesNo (Tree a) where
	 yesno EmptyTree = False
	 yesno _ = True

instance YesNo TrafficLight where
	 yesno Red = False
	 yesno _ = True

yesnoIf :: (YesNo y) => y -> a -> a -> a
yesnoIf yesnoVal yesResult noResult = if yesno yesnoVal then yesResult else noResult

-- ***

--class Functor f where
--      fmap :: (a -> b) -> f a -> f b

--instance Functor Maybe where
--	 fmap f (Just x) = Just (f x)
--	 fmap f Nothing = Nothing

instance Functor Tree where
	 fmap f EmptyTree = EmptyTree
	 fmap f (Node x leftsub rightsub) = Node (f x) (fmap f leftsub) (fmap f rightsub)

data EEither a b = ELeft a | ERight b

instance Functor (EEither a) where
	 fmap f (ELeft a) = ELeft a
	 fmap f (ERight a) = ERight (f a)

-- ***

