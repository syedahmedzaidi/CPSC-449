 __________________________________________________
|                                                  |
|	Name = Syed Ahmed Hassan Zaidi             |
|	UCID = 10150285                            |
| 	Assignment2.hs                             |
|__________________________________________________|

------------------------------------------------------------------------

Documentation:

List of functions in Assignment2.hs:

1) ternaryNOT
2) ternaryAND
3) ternaryOR
4) ternaryNOT'
5) ternaryAND'
6) ternaryOR'
7) countEven
8) countEven'
9) myTail
10) areSame
11) substringSearch
12) listVideos

Functions/data types that directly asnwer questions:

-- Please note: For Question 3 the use of (Just _) is required with in command prompt. Also note it must be wrapped around round parentheses. -- 
	Question 1: data Ternary

	Question 2: a) ternaryNOT
	    	    b) ternaryAND
	    	    c) ternaryOR

	Question 3: a) ternaryNOT'
	    	    b) ternaryAND'
	    	    c) ternaryOR'

	Question 4: a) countEven
	    	    b) countEven'

	Question 5: listVideos

Helper Functions:

1) myTail
2) startWith
3) substringSearch

Function/data types explainations:

0) data Ternary: defines an enumerated algebraic data type that has three possible constructors - "Troo" , "Falz" , "Unknown". It also derives "Show" & "Eq" that help us time to display and compare our own types.
1) ternaryNOT: takes in one Ternary types and returns a Ternary. if its "Troo" it returns Falz, if its "Falz" returns Troo, and if its unknown; it returns Unkown. (Performs negation).
2) ternaryAND: takes in two Ternary Types an returns a Ternary. It has 4 gaurd statements and each gaurd statement deals with special cases of Logical AND. Covers all of logical AND truth table.
3) ternaryOR: just like its predecessor it has exact same functionality as ternaryAND except for the logical differences.
4) ternaryNOT': Unlike its counterpart, ternaryNOT' uses (Maybe Bool) functionality to deal with ternary logic. It deals with unknown with the use of built in null value "Nothing" accessor. If it is "Nothing"; it returns nothing. If it is (Just _) then it returns the negation of that value.
5) ternaryAND': Uses the (Maybe Bool) functionality. It performs logical AND throught use of 4 special cases. The first case deals with if both are Nothing; in that case it returns nothing. The second and third cases deal with the placement of Nothing in first or second argument. And the last case performs all other logical AND for (Just True) & (Just False).
6) ternaryOR': just like the predecessor function it has exactly same 4 cases that do the logical OR computation.
7) countEven: takes in a list of integers and gives an integer number as a result. It has two general cases. One is a base case one is inductive case. Through use of recursion, it checks the head of the list, if it is even( checked via parity test); it adds one, and then moves on to the tail, otherwise if it isnt it moves on the tail without incrementing.
8) countEven': A more simplified way of counting even numbers in a list. Through list comprehension, it creates a list consisting of only even numbers from an input list. It then uses length from default loaded prelude library to find length of the list with only even numbers in it.
9) myTail: a simple helper function that return the tail of a list (the first function chopped off). I asked Robert if we could use tail function from prelude but apparently we werent allowed to thus i created one for myself.
10) areSame: compares two string if they are equal.
11) substringSearch: basically at each iteration compare the first string with second string. If there is a match return True, if there isnt call substring search with first string and the tail of second string with the first head of second string dropped.
12) listVideos: with simple implementation of list comprehension; call substringSearch on first string and all videos stored in database. If there is a match (returns true), then print it.



