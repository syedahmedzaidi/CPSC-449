 __________________________________________________
|                                                  |
|	Name = Syed Ahmed Hassan Zaidi             |
|	UCID = 10150285                            |
| 	Assignment4.pl & Question3A4.pl            |
|__________________________________________________|

------------------------------------------------------------------------

Documentation:

List of functions that answer the questions:

--Please note this only includes questions 1,2,4 only. Question 3 is described after all of these descriptions.--

1) isPermutation
2) isSublist
3) solution(M)


Descriptions:

Question 1) isPermutation: uses the putinto to say that Z is a permutation of [X|Y] provided W is a permutation of Y and then X is put into W to produce Z. As a base case it says that empty list [] is the only permutation of empty list []. putinto(X,Z,W) is being used as X put into W is Z.

Question 2) isSublist: trys to match both list's heads and if so, then the subsequence of the tail of the first list (T), should be tail of second list T2. If not then sublist of the tail of the first list is still the same sublist as the one for the complete first list.

Question 4) solution(M): since there are only 8 possible solutions ( 6 where legolas is carrying everyone) and 2 other solutions 1 where the shorter amount of time person travels back (aragon) and the 2 slowest travellers cross together. Keeping that in mind, solution(M) is made where T is unified with the list of all 4 people and then passed to the transitions predicate. The transition predicate passes the list to cross bridge where it is patterned matched to see if it is to cross the bridge or bring the torch back. If it is to take 2 people with torch, the first crossBridge is where it takes torch back, and 2nd crossBridge takes torch to final state of the while calcTime calculates how much time has taken place. calcTime adds time and at the end of solve it sees if the generated permutation is under 18 (D0 =< D).

Question 3) To play the game, write "play." All instructions are written on the screen. For comments visit the code. To restart anytime with in the game write "restart."

Following is an acceptable game play (you are welcome to try on your own and explore the game) :-

?- play.
?- take(pin).
?- walk(north).
?- killThe(guardWithKeys).
?- take(keys).
?- walk(north).
?- walk(north).
?- take(dagger).
?- walk(east).
?- walk(west).
?- walk(west).
?- walk(up).
?- take(stake).
?- walk(north).
?- take(garlic).
?- take(candle).
?- take(matchBox).
?- walk(south).
?- walk(west).
?- take(book).
?- readThe(book).
?- walk(left).
?- take(invisibilityCloak).
?- take(longSword).
?- take(helmet).
?- take(chainmail).
?- take(shield).
?- useThe(longSword).
?- useThe(helmet).
?- useThe(chainmail).
?- useThe(shield).
?- walk(back).
?- walk(east).
?- walk(east).
?- take(detailedMap).
?- walk(west).
?- walk(south).
?- walk(south).
?- walk(out).

