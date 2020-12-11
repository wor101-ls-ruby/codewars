=begin
**Problem**
Sort the given strings in alphabetical order, case insensitive. 


Rules:
Explicit
  - Input: an Arry of String elements
  - Output: an Array of String elements

**Examples / Test Cases**
For example:
["Hello", "there", "I'm", "fine"]  -->  ["fine", "Hello", "I'm", "there"]
["C", "d", "a", "B"])              -->  ["a", "B", "C", "d"]


**Data Structures**
- input Array (input_array)
- output Array (sorted_array)



**Algorithm**
1. use the sort_by method on the input array
2. for each element call the downcase method on it

=end
def sortme(input_array)
  input_array.sort_by do |string|
    string.downcase
  end
end


p sortme(["Hello", "there", "I'm", "fine"]) == ["fine", "Hello", "I'm", "there"]
p sortme(["C", "d", "a", "B"]) == ["a", "B", "C", "d"]
p sortme(["CodeWars"]) == ["CodeWars"]