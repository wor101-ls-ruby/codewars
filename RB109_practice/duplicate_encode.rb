=begin
**Problem**
The goal of this exercise is to convert a string to a new string where each character in the new string is "(" if that character appears only once in the original string, 
or ")" if that character appears more than once in the original string. Ignore capitalization when determining if a character is a duplicate.

Assertion messages may be unclear about what they display in some languages. If you read "...It Should encode XXX", the "XXX" is the expected result, not the input!

Rules:
Explicit
  - Input: a String
  - Output: a String
  - if char appears only once in string replace it with '('
  - if char appears more than once replace it with ')'
  - white space counts as a char?

**Examples / Test Cases**
"din"      =>  "((("
"recede"   =>  "()()()"
"Success"  =>  ")())())"
"(( @"     =>  "))((" 


**Data Structures**


**Algorithm**
1. intialize return_string variable and set to''
2. turn input_string into an array using the #chars method
3. iterate over the input array
  - for each char use the #count method on the input string to see how many times it occurs
  - if it occurs only once then add '(' to the return array
  - if it occurs more than once add ')' to the return array
4. return the return_array

=end

def duplicate_encode(input_string)
  return_string = ''
  
  input_string.chars.each { |char| input_string.downcase.count(char.downcase) > 1 ? return_string += ')' : return_string += '(' }

  return_string
end

p duplicate_encode("din") == "((("
p duplicate_encode("recede") == "()()()"
p duplicate_encode("Success") == ")())())"
p duplicate_encode("(( @") == "))(("