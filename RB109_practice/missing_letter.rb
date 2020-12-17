=begin
**Problem**
Find the missing letter
Write a method that takes an array of consecutive (increasing) letters as input and that returns the missing letter in the array.

You will always get an valid array. And it will be always exactly one letter be missing. The length of the array will always be at least 2.

The array will always contain letters in only one case.

Use the English alphabet with 26 letters.


Rules:
Explicit
  - Input: an Array of letters
  - Output: a String character of one letter

**Examples / Test Cases**
Example:

['a','b','c','d','f'] -> 'e'
['O','Q','R','S'] -> 'P'


**Data Structures**
- input Array of strings (input_array)
- output String called missing_letter

**Algorithm**
1. create a range of letters from the first letter of input_array to the last letter of input_array
2. iterate over the range with the each method
  - for each letter in the range check to see if it is included in the input-array
  - if it is not included return the character


=end

def find_missing_letter(input_array)
  
  (input_array.first..input_array.last).each do |character|
    if input_array.include?(character)
      next
    else
      return character
    end
  end
  
end

p find_missing_letter(["a","b","c","d","f"]) == "e"
p find_missing_letter(["O","Q","R","S"]) == "P"
p find_missing_letter(["b","d"]) == "c"
p find_missing_letter(["a","b","d"]) == "c"
p find_missing_letter(["b","d","e"]) == "c"