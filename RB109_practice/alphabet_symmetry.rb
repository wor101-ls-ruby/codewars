=begin
**Problem**
Consider the word "abode". We can see that the letter a is in position 1 and b is in position 2. 
n the alphabet, a and b are also in positions 1 and 2. 
Notice also that d and e in abode occupy the positions they would occupy in the alphabet, which are positions 4 and 5.

Given an array of words, return an array of the number of letters that occupy their positions in the alphabet for each word. For example,

Input will consist of alphabet characters, both uppercase and lowercase. No spaces.

Rules:
Explicit
  - Input: Array of strings
  - Output: Array of integers
  - strings will consist of uppercase and lowercase alphabetic characters
  - no spaces
Implicit
  - there will be no integers or non-alphabetic characters
  - the output array should be the same size as the input array

**Examples / Test Cases**
solve(["abode","ABc","xyzD"]) == [4, 3, 1]

**Data Structures**
- input array of strings
- output array of integers

**Algorithm**
1. Initialize a new Array equal in size to the input array and set eqch value equal to zero
2. Iterate over each element in the input array
3. for each word element, iterate over each character with the index
  - if the characters position in the alphabet is equal to its index location + 1 in the word increase the value in the return array by one
4. Return the array of integers

=end

def create_alphabet_hash
  alphabet = ('a'..'z').to_a
  alphabet_hash = {}
  
  alphabet.each_with_index do |letter, index|
    alphabet_hash[letter] = index + 1
  end
  alphabet_hash
end

def solve(array_of_strings)
  index_matches = Array.new(array_of_strings.length, 0)
  letter_position = create_alphabet_hash

  array_of_strings.each_with_index do |string, string_index|
    
    string.downcase.chars.each_with_index do |char, char_index|
      if (char_index + 1) == letter_position[char]
        index_matches[string_index] += 1
      end
    end
    
  end
  index_matches
end

p solve(["abode","ABc","xyzD"]) == [4, 3, 1]
p solve(["abode","ABc","xyzD"]) == [4,3,1]
p solve(["abide","ABc","xyz"]) == [4,3,0]
p solve(["IAMDEFANDJKL","thedefgh","xyzDEFghijabc"]) == [6,5,7]
p solve(["encode","abc","xyzD","ABmD"]) == [1, 3, 1, 3]