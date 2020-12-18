=begin
**Problem**
Welcome.

In this kata you are required to, given a string, replace every letter with its position in the alphabet.

If anything in the text isn't a letter, ignore it and don't return it.

"a" = 1, "b" = 2, etc.


Rules:
Explicit
  - Input: a String
  - Output: a String of numbers from 1 to 26
  - replace each letter in the input string with its position in the alphabet
  - each position in the return string should be separated by whitespace
  - if there is a non-alphabetic character skip it
  - case should not matter but will receive both upper and lowercase characters

**Examples / Test Cases**
Example
alphabet_position("The sunset sets at twelve o' clock.")
Should return "20 8 5 19 21 14 19 5 20 19 5 20 19 1 20 20 23 5 12 22 5 15 3 12 15 3 11" (as a string)


**Data Structures**
- input String called input_string
- output String return_string
- an Array called letter_positions 



**Algorithm**
1. create an Array of alphabet characters from 'a' to 'z' called alphabet
2. initalize an Array called letter_positions
3. turn input_string into an array of characters and iterate over it
  - if the current character is not included in alphabet go to the next character
  - if it is included find that characters index position in alphabet
  - add the index position + 1 converted to a string as an element to letter_positions array
4. join the letter_positions array with ' ' and return

=end

def alphabet_position(input_string)
  alphabet = [nil] + ('a'..'z').to_a
  letter_positions = []
  
  input_string.chars.each do |character|
    next if alphabet.include?(character.downcase) == false
    letter_positions << alphabet.index(character.downcase).to_s
  end
  
  p letter_positions.join(' ')
end
  

p alphabet_position("The sunset sets at twelve o' clock.") == "20 8 5 19 21 14 19 5 20 19 5 20 19 1 20 20 23 5 12 22 5 15 3 12 15 3 11"
p alphabet_position("-.-'") == ""