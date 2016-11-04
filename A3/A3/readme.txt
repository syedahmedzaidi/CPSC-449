 __________________________________________________
|                                                  |
|	Name = Syed Ahmed Hassan Zaidi             |
|	UCID = 10150285                            |
| 	Assignment3.hs                             |
|__________________________________________________|

------------------------------------------------------------------------

Documentation:

List of functions in Assignment3.hs:

1) randomGene
2) height
3) eval
4) eval'
5) showExpression

Helper functions:
1) Prelude function: max

Functions/data types that directly asnwer questions:


	Question 1: randomGene

	Question 2: height
	    	   
	Question 3: eval

	Question 4: eval'

	Question 5: showExpression

	Data type: Expression (Used from question 2 onwards)


Function/data types explainations:

1) randomGene: takes in an int value and returns an int value. A simple function that takes input multiplys by 7 and find remainder mod 101. Since 101 is prime, it will always give answers in between 1 to 100. But since we want a number between 0 to 10, we just take that number (x) subtract 1 and mod by 10 to give an answer between 0 to 10 then we add 1 

2) height: The function height takes in an expression(data type) and returns an Int. It has two cases; 1 base case one recursive case. The base case simply states that node literal has the value 0 in terms of height. Where as recursive call case searches for a node and if it is a subtree, add 1 and do recursive call on the sub tree

3) eval : The function eval takes in an expression as an argument and return a boolean value. The first case; base case represent that the literal value is returned itself. If it is an AND operation, it recursively calls itself on both node to see if it is a sub tree or not. if it is it searches the sub tree to keep on looping until a literal is found, and then performs AND operation. The same process is applied for OR except it performs and OR operation

4) eval': The function eval' takes in an expression as an argument and returns a boolean value. The first three cases are exactly similar to eval with the only addition of XOR and NOT. To achieve this, the data type Expression was changed to include an expression type of one operand and one expression to use for NOT, where as XOR still uses old constructor. The Not operation simply performs negation of literal after it has been recursively found. The XOR operation performs the XOR

5) showExpression: takes an expression as an input and returns a string. There are 5 cases, 4 recursive ones in total. The base case is the first case which looks for the literal if it is true or false. If it is it returns a string with one character "T" in case of true or "F" in case of false. All the other cases have one recursive call then a concat operator that concats the base case with the symbol for the operator then another base case that is concated to the symbol. All the cases are similar except for NOT operator with has only one recursive call concated to ~ for negation.