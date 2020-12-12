=begin
**Problem**
Given two arrays of strings a1 and a2 return a sorted array r in lexicographical order of the strings of a1 which are substrings of strings of a2.

- Arrays are written in "general" notation. See "Your Test Cases" for examples     in your language.

- In Shell bash a1 and a2 are strings. The return is a string where words are     separated by commas.

- Beware: r must be without duplicates.

- Don't mutate the inputs.

Rules:
Explicit
  - Input: two arrays with string elements
  - Output: one array of string elements or []
  - the return array should only consist of elements form array1 that are substrings in an element in array2
  - the return array should be in alphabetical order
  - if none of the elements in array1 are substrings of the elements in array2, return an empty array

**Examples / Test Cases**
#Example 1: 
a1 = ["arp", "live", "strong"]
a2 = ["lively", "alive", "harp", "sharp", "armstrong"]

returns ["arp", "live", "strong"]

#Example 2: 
a1 = ["tarp", "mice", "bull"]
a2 = ["lively", "alive", "harp", "sharp", "armstrong"]

returns []


**Data Structures**
- input Arrays
- output Array

**Algorithm**
1. intializing an Array called return_array that will be empty
2. iterate over array1
  - valid_substring = false
  - for each string in array1 iterate over array2
    - use #include? method to see if word2 includs word1
3. return return_array
=end




def in_array(array1, array2)
  return_array = []
  
  array1.each do |word1|
    valid_substring = false    
    array2.each { |word2| word2.include?(word1) ? valid_substring = true : next }    
    valid_substring == true ? return_array << word1 : next
  end  
  return_array.sort
end


a1 = ["arp", "live", "strong"]
a2 = ["lively", "alive", "harp", "sharp", "armstrong"]
p in_array(a1, a2) == ["arp", "live", "strong"]

a1 = ["tarp", "mice", "bull"]
p in_array(a1, a2) == []
