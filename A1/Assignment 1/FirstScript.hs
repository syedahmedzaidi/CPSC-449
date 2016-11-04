import Test.QuickCheck
ord :: Char -> Int
ord c = fromEnum c

chr :: Int -> Char
chr i = (toEnum i)::Char

--Question 1
foo :: Char -> Int
foo x
   | (num >= aBound) && (num <= zBound) = returnVal
   | otherwise                          = anythingElse
   where num = ord (x)
	 aBound = 65
	 zBound = 90
	 returnVal = ord(x) - aBound
	 anythingElse = 25

--Used for encryption and decryption (not part of question 1)
fooReverse :: Int -> Char
fooReverse x
   | ( x <= 25) = chr( x + aBound)
   | otherwise = 'Z'
   where aBound = 65

--Question 2

repeatFirst :: [a] -> [b] -> [a]
repeatFirst as bs = go as bs
   where go  _     []     = []
         go (x:xs) (_:ys) = x : go xs ys
         go []     ys     =     go as ys
    
	
--Question 3

oneCipher :: Int -> Char -> Char
oneCipher x y =  fooReverse( (foo y + x) `mod` 26)


encrypt :: [Char] -> [Char] -> [Char]
encrypt [] [] = []
encrypt [] (_:_) = []	
encrypt (x:xs) [] = (x:xs)
encrypt (a:as) (b:bs) = oneCipher (foo b) a :  encrypt as (repeatFirst (bs++[b]) as)

decrypt :: [Char] -> [Char] -> [Char]
decrypt [] [] = []
decrypt [] (_:_) = []
decrypt (x:xs) [] = (x:xs)
decrypt (a:as) (b:bs) = oneCipher ( 26 - foo b) a : decrypt as (repeatFirst(bs++[b]) as)

--Question 4

filterInput :: [Char] -> [Char]
filterInput [] = []
filterInput (_:[]) = []
filterInput (x:xs)
    | (num >= aBound) && (num <= zBound) = (x : filterInput xs)
    | otherwise = filterInput xs
    where num = ord (x)
	  aBound = 65
	  zBound = 90

test_crypt :: [Char] -> [Char] -> Bool
test_crypt [] _ = True
test_crypt _ [] = True
test_crypt text key = 
		filterInput text == decrypt ( encrypt (filterInput text) (filterInput key ) ) (filterInput key)

