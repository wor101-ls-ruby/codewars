=begin
**Problem**
An anagram is the result of rearranging the letters of a word to produce a new word (see wikipedia).

Note: anagrams are case insensitive

Complete the function to return true if the two arguments given are anagrams of each other; return false otherwise.

Rules:
Explicit
  - Input: two Strings (str1, str2)
  - Output: a Boolean
  - return true if both words contain the same letters in the same amounts as each other
  - return false if they dont
  - case does not matter

**Examples / Test Cases**
"foefet" is an anagram of "toffee"

"Buckethead" is an anagram of "DeathCubeK"


**Data Structures**
- input Strings (str1, str2)
- output Boolean (anagram)

**Algorithm**
1. intialize a Boolean variable called anagram and set to true
2. iterate through each character of the str1
  - check to see if the count of current character is the same in str1 as it is in str2
  - if it is continue to the next character
  - if it is not set anagram to false and break
3. return anagram

=end

def is_anagram(str1, str2)
  anagram = true
#   word1 = str1.chars.map { |char| char.downcase }
#   word2 = str2.chars.map { |char| char.downcase }
  
  return false if str1.size != str2.size
  
  str1.chars.each do |char|
    if str1.downcase.count(char.downcase) == str2.downcase.count(char.downcase)
      next
    else
      anagram = false
      break
    end
  end
  anagram
end



p is_anagram('Creative', 'Reactive') ==  true
p is_anagram("foefet", "toffee") == true
p is_anagram("Buckethead", "DeathCubeK") == true
p is_anagram("Twoo", "WooT") == true
p is_anagram("dumble", "bumble") == false
p is_anagram("ound", "round") == false
p is_anagram("apple", "pale") == false

