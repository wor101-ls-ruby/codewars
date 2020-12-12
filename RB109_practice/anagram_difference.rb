=begin
**Problem**
Given two words, how many letters do you have to remove from them to make them anagrams?

Hints
  - A word is an anagram of another word if they have the same letters (usually     in a different order).
  - Do not worry about case. All inputs will be lowercase.
  - When you're done with this kata, check out its big brother/sister :             https://www.codewars.com/kata/hardcore-anagram-difference

Rules:
Explicit
  - Input: input two Strings (str1, str2)
  - Output: an Integer
  - anagrams contain the same letters in the same amounts
  - return the number of letters that must be removed from both strings to make an anagram
  - if no letters match you have to remove all the letters from both

**Examples / Test Cases**
First word : c od e w ar s (4 letters removed)
Second word : ha c k er r a nk (6 letters removed)
Result : 10


**Data Structures**
- input Strings
- output Integer


**Algorithm**
1. intialize an Integer variable called removed_letters and set equal to 0
2. intialize an empty Array variable called used_letters 
3. iterate over the characters in the longest word
  - if current char is not in used_letters then && str2 is bigger than 0
    -check the count of the char in longest word vs the count in the other word
    - add the absolute value of the differenct ot removed_letters
    - add the letter to used_letters
    - delete letter from str2
  - else go to next character
4. if str2 is larger than 0 add the size to removed_letters
5. return removed_letters

=end
require 'pry'

def anagram_difference(str1, str2)
  removed_letters = 0
  used_letters = []
  longest_word = nil
  
  str1.size >= str2.size ? longest_word = str1 : longest_word = str2
  
  return str1.size if str2.size == 0
  return str2.size if str1.size == 0
  

  longest_word.chars.each do |char|
    if used_letters.include?(char) == false && str2.size > 0
      
      difference = str1.count(char) - str2.count(char)
      difference = difference.abs
      removed_letters += difference
      used_letters << char
      str2.delete!(char)
      str1.delete!(char)

    else
      next
    end    
  end

  removed_letters += str1.size
  removed_letters += str2.size
  removed_letters
  
end



p anagram_difference('', '') == 0
p anagram_difference('a', '') == 1
p anagram_difference('', 'a') == 1
p anagram_difference('ab', 'a') == 1
p anagram_difference('ab', 'ba') == 0
p anagram_difference('ab', 'cd') == 4
p anagram_difference('aab', 'a') ==2
p anagram_difference('a', 'aab') == 2
p anagram_difference('codewars', 'hackerrank') == 10