--Question1
randomGene :: Int -> Int
randomGene i = randomNum
	where randomNum = (x - 1) `mod` 10 + 1
	      x = 7 * (i) `mod` 101
	      


--Question2
data Expression = Literal Bool | Operation Operator Expression Expression | Operation' Operator Expression deriving (Show)
data Operator = AND | OR | NOT | XOR deriving (Show)

height :: Expression -> Int
height (Literal n) = 0
height (Operation op t1 t2) =  1 + max (height t1) (height t2)

--Question3

eval :: Expression -> Bool
eval (Literal n) = n
eval (Operation AND t1 t2) = (eval t1) && (eval t2)
eval (Operation OR t1 t2) = (eval t1) || (eval t2)

--Question4
eval' :: Expression -> Bool
eval' (Literal n) = n
eval' (Operation AND t1 t2) = (eval' t1) && (eval' t2)
eval' (Operation OR t1 t2) = (eval' t1) || (eval' t2)
eval' (Operation' NOT t) = not (eval' t)
eval' (Operation XOR t1 t2) = ((eval' t1) || (eval' t2)) && not((eval' t1) && (eval' t2))

--Question5
showExpression :: Expression -> String
showExpression (Literal n) 
	| n == True = "T"
	| n == False = "F"
showExpression (Operation AND t1 t2) = "(" ++ (showExpression t1) ++ " ^ " ++ (showExpression t2) ++ ")"
showExpression (Operation OR t1 t2) =  (showExpression t1) ++ " v " ++ (showExpression t2)
showExpression (Operation' NOT t1 ) = " ~ " ++ (showExpression t1)
showExpression (Operation XOR t1 t2) = (showExpression t1) ++ " + " ++ (showExpression t2)

