**Problem**
ROT13 is a simple letter substitution cipher that replaces a letter with the letter 13 letters after it in the alphabet. 
ROT13 is an example of the Caesar cipher.

Create a function that takes a string and returns the string ciphered with Rot13. 
If there are numbers or special characters included in the string, they should be returned as they are. 
Only letters from the latin/english alphabet should be shifted, like in the original Rot13 "implementation".

Rules:
Explicit
  - Input: string
  - Output: string
  - input string can contain letters, and special characters
  - only alphabet characters should be altereed
  - each alphabet characters should be replaced with the letter 13 letters after it in the alphabet
Implicit
  - case should be preserved
  - the alphabet loops?

**Examples / Test Cases**
"grfg" == rot13("test")

"Grfg" == rot13("Test")


**Data Structures**
- Input string
- Output string

**Algorithm**
1. create new string to be returned
2. iterate over each character in the string
3. if the character is not alphabetic add it to the new string
4. if the character is alphabetic add the letter 13 letters after it to the new string (String#succ)
5. return new string 