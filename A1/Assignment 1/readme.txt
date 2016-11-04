 __________________________________________________
|                                                  |
|	Name = Syed Ahmed Hassan Zaidi             |
|	UCID = 10150285               	           |
|__________________________________________________|

------------------------------------------------------------------------

Documentation:


List of functions in FirstScript.hs:
1) foo
2) fooReverse
3) repeatFirst
4) oneCipher
5) encrypt
6) decrypt
7) filterInput
8) test_crypt (quickCheck test function)

Functions that directly asnwer questions:
Question 1: foo
Question 2: repeatFirst
Question 3: encrypt/decrypt
Question 4: test_crypt

Function explainations:

1) foo: foo takes in a character and then using gaurds it checks whether the ord of that character (basically the ascii) is between aBound and zBound.
        If it is then it takes the ascii of that input character and subtracts it from the ascii of A to get indexed number between 0-25. If it isnt between
        aBound and zBound (&& operater used thus both should be held true) then it simply returns 25.

2) fooReverse: fooReverse essentialy works the same as foo but instead it takes an int number converts it to its respected ascii value and displays it to screen.
3) RepeatFirst: repeatFirst takes two lists as an input and returns a list. repeatFirst is defined in terms of "go". There are three pattern matching cases. It is
                defined as a recursive case. It takes the second string and makes the length of the first string equal to that by repeating characters of first string.
4) oneCipher: oneCipher is essentially a function that takes in an Int value and a Char value and perform caeser shift cipher on it. It is basically the Vigenere
              cipher done on on character.
5) encrypt: encrypt takes in two strings and returns a string. It uses "oneCipher" and recursion as its basis of accomplishing this task. It repeats the second                     string and makes it equal length as the first string while using "oneCipher" on the first letter and then moving on.
6) decrypt: The same logic was implemented for decrypt as implemented for encrypt.
7) filterInput: filterInput is a very simple function that takes in a list of Character (string) and check each item of the list if they are between 'A' & 'Z'. 
                If not it drops them, if they are it puts them in a list and returns that list.
8) test_crypt: test_crypt is a function proof for encrypt and decrypt that decrypt can be used to reverse the encrypt function to return the original plain text. 
               Since quickCheck uses random generated values; filterInput is used to filter out any non-uppercase values. It is a proved function as it passes all 100
               tests.

Functions manually tested by following commands:

- foo 'A'
- foo 'a'
- foo 'P'
- foo 'p'
- foo 'Z'
- foo 'z'
- repeatFirst "KEY" "MESSAGE"    
- repeatFirst "LEMON" "ATTACKATDAWN"
- encrypt "ATTACKATDAWN" "LEMON"
- encrypt "CRYPTOISSHORTFORCRYPTOGRAPHY" "ABCD"
- decrypt "LXFOPVEFRNHR" "LEMON"
- decrypt "CSASTPKVSIQUTGQUCSASTPIUAQJB" "ABCD"

Results: 100% passed.

