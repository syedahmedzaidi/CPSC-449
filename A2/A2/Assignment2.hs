import Data.Maybe

--Question 1
data Ternary = Falz | Troo | Unknown deriving (Eq, Show)

--Question 2
ternaryNOT :: Ternary -> Ternary
ternaryNOT Troo = Falz
ternaryNOT Falz = Troo
ternaryNOT Unknown = Unknown

ternaryAND :: Ternary -> Ternary -> Ternary
ternaryAND x y
	| (x == Troo) && (y == Troo) = Troo
	| (x == Troo) && (y == Unknown) = Unknown
	| (x == Unknown) && (y /= Falz) = Unknown
	| otherwise = Falz

ternaryOR :: Ternary -> Ternary -> Ternary
ternaryOR x y
	| (x == Unknown) && (y /= Troo) = Unknown
	| (x == Falz) = y
	| otherwise = Troo

--Question 3
ternaryNOT' :: (Maybe Bool) -> (Maybe Bool)
ternaryNOT' Nothing = Nothing
ternaryNOT' (Just x) = (Just (not x))

ternaryAND' :: (Maybe Bool) -> (Maybe Bool) -> (Maybe Bool)
ternaryAND' Nothing Nothing = Nothing
ternaryAND' Nothing (Just x)
	| (x == True) = (Just True)
	| (x == False) = (Just False) 
ternaryAND' (Just x) Nothing
	| (x == True) = (Just True)
	| (x == False) = (Just False)
ternaryAND' (Just x) (Just y) = Just ( x && y )

ternaryOR' :: (Maybe Bool) -> (Maybe Bool) -> (Maybe Bool)
ternaryOR' Nothing Nothing = Nothing
ternaryOR' Nothing (Just x)
	| (x == True) = (Just True)
	| (x == False) = Nothing 
ternaryOR' (Just x) Nothing
	| (x == True) = (Just True)
	| (x == False) = Nothing
ternaryOR' (Just x) (Just y) = Just ( x || y )

--Question 4
countEven :: [Int] -> Int
countEven [] = 0
countEven  (x:xs)
    | ((x `mod` 2) == 0)   = 1 + (countEven xs )
    | otherwise     = countEven xs

countEven' :: [Int] -> Int
countEven' n = length [x | x <- n ,  x `mod` 2 == 0 ]

--Question 5
myTail :: [Char] -> [Char]
myTail (_:xs) = xs
myTail [] = []

areSame :: [Char] -> [Char] -> Bool
areSame [] _ =  True
areSame _  [] =  False
areSame (x:xs) (y:ys)=  (x == y) && (areSame xs ys)

substringSearch :: [Char] -> [Char] -> Bool
substringSearch [] _ = True
substringSearch _ [] = False
substringSearch x y = (areSame x y) || (substringSearch x (myTail y))

type Client = Int
type Video = [Char]
type Relation = [ (Client, Video) ]
dataBase :: Relation
dataBase = [(763547, "The Thing"),(929845, "The Thing"),(181014, "Big Trouble in Little China"),(929845, "Escape from New York")]

listVideos :: Relation -> [Char] -> [Video]
listVideos  db str = [vid | (_ , vid) <- db, (substringSearch str vid) == True]



