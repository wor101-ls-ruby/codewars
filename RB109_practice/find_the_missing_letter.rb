=begin
**Problem**
#Find the missing letter

Write a method that takes an array of consecutive (increasing) letters as input and that returns the missing letter in the array.

You will always get an valid array. And it will be always exactly one letter be missing. The length of the array will always be at least 2.
The array will always contain letters in only one case.

(Use the English alphabet with 26 letters!)

Rules:
Explicit
  - Input: an Array of string characters
  - Output: a string of a single character
  - the input string characters will be either all downcase or all upcase
  - the return should be downcase or upcase to match the input
  - the input will always be at least 2 characters long
  - find and return the character that is missing from the alphabetic sequence input

**Examples / Test Cases**
['a','b','c','d','f'] -> 'e' ['O','Q','R','S'] -> 'P'

["a","b","c","d","f"] -> "e"
["O","Q","R","S"] -> "P"


**Data Structures**
- input Array of string characters (input_letters)
- output String character called missing_letter
- an Array called alphabet that holds all the leters of the alphabet


**Algorithm**
1. intialize an Array called alphabet and set to a range from the first letter in input_letters to the last letter in input_letters

2. iterate through the alphabet array
  - for each letter check to see if it is included in the input_letters
  - if it is not return it


=end

def find_missing_letter(input_letters)
  alphabet = (input_letters.first..input_letters.last).to_a
  
  alphabet.each { |letter| input_letters.include?(letter) ? next : (return letter) }
end



p find_missing_letter(["a","b","c","d","f"]) == "e"
p find_missing_letter(["O","Q","R","S"]) == "P"
p find_missing_letter(["b","d"]) == "c"
p find_missing_letter(["a","b","d"]) == "c"
p find_missing_letter(["b","d","e"]) == "c"
