=begin
**Problem**
Complete the solution so that it splits the string into pairs of two characters. 
If the string contains an odd number of characters then it should replace the missing second character of the final pair with an underscore ('_').



Rules:
Explicit
  - Input: string of characters
  - Output: Array of string elements
  - split the input string into an array of 2 character string elements
  - if an odd number of characters, replace the missing 2nd charcter of final pair with '_'
Implicit
  - An empty string should return an empty array
  - no white space?

**Examples / Test Cases**
solution("abcdef") == ["ab", "cd", "ef"]
solution("abcdefg") == ["ab", "cd", "ef", "g_"]
solution("") ==  []

**Data Structures**
- input String
- output Array

**Algorithm**
1. Initialze the return Array
2. determine the length of the input string
3. Initialize an index counter and set o 0
4. loop a number of times equal to half the lenght of the string (need to deal with size 1 or less)
5. each time take two characters from the input string using counter and counter +1 as index
6. push the two characters to the return Array
7. if input strings size isodd take last character of input string add '_' and push to return array
8. return the array

=end

def solution(string)
  return_array = []
  counter = 0
  
  (string.size / 2).times do 
    return_array << string[counter..(counter + 1)]
    counter += 2
  end
  
  return_array << string[-1] + '_' if string.size.odd? 

  p return_array
end


p solution("abcdef") == ["ab", "cd", "ef"]
p solution("abcdefg") == ["ab", "cd", "ef", "g_"]
p solution("") ==  []