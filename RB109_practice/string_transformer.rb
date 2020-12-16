=begin
**Problem**
Given a string, return a new string that has transformed based on the input:

Change case of every character, ie. lower case to upper case, upper case to lower case.
Reverse the order of words from the input.
Note: You will have to handle multiple spaces, and leading/trailing spaces.

You may assume the input only contain English alphabet and spaces.

Rules:
Explicit
  - Input: a String
  - Output: a String
  - change case of all lower case characters to uppercase
  - change case of all uppercase chcaracters to lowercase
  - reverse order of words from the input
  - input will only contain english alphabet and spaces
  - there will be multiple white spaces and trailing/leading whitespace

**Examples / Test Cases**
"Example Input" ==> "iNPUT eXAMPLE"


**Data Structures**
- input String
- output String
- an Array of string words


**Algorithm**
1. create an Array called words by splittin the input_string by ' ' 
2. iterate over words using destructive form of map!
    - pass current word to switch_case method 
3. reverse words Array and join with ' '
4. return words Array


**switch_case algorithm**
1. accepts one string  as input that wll be called word
2. create a range from 0 up to but not including the size of word
3. iterate over the range using #each method and using he current range as index
  - check the current character of word at index to see if it is uppercase
  - if uppercase switch to lowercase
  - else switch to uppercase
4. return word

**revise_algorithm**
1. turn input strin into an array of characters
2. send every character to the switch_case method
3. create a return_string
4. create  current_word to ''

4. creat a range from 0 up to but not including the sze of the reverse_string
  - if the current character is ' ' 
    - unshift current_word to return_array
    - set current_word to equal '' 
    -unshift ' ' to the return array
  - elsif push current character to current_word
    -if  reverse_string[index + 1 = nil] the unshift current_word to return_array
5. join return array
6. return retrn_array
=end

def switch_case(word)
  characters = word.chars
  (0...word.size).each { |index| characters[index] == characters[index].upcase ? characters[index].downcase! : characters[index].upcase! }
  characters.join
end


def string_transformer(input_string)
  characters = input_string.chars
  characters.map! { |char| switch_case(char) }
  
  return_array = []
  
  current_word = ''
  (0...characters.size).each do |index|
    if characters[index] == ' '
      return_array.unshift(current_word)
      return_array.unshift(characters[index])
      current_word = ''
    else
      current_word << characters[index]
      return_array.unshift(current_word) if index == (characters.size - 1)
    end
  end
  
  return '' if return_array == []
  p return_array.join
end


p string_transformer('Example string') == 'STRING eXAMPLE'