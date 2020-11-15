=begin
**Problem**
Write a function that takes a shuffled list of unique numbers from 1 to n with one element missing (which can be any number including n). Return this missing number.

Note: huge lists will be tested.

Rules:
Explicit
  - Input: an array of integers
  - output: an integer
  - input array will be a list of numbers from 1 to n with one number missing
  - the list will be shuffled
  - return the missing number
Implicit
  - all integers (no floats)
  - if all numbers are in as series the return the next number that would appear

**Examples / Test Cases**
zoo([1, 3, 4])  ==  2
zoo([1, 2, 3])  ==  4
zoo([4, 2, 3])  ==  1

**Data Structures**
- input array
- output integer

**Algorithm**
1. Sort the input array from smallest to largets
2. Iterate over that array
  - check to see if the next number is one greater than the current number
  - if not then return the current number + 1
  - if the current number is the last element then return it + 1
=end

require 'pry'

# def zoo(array)
#   array = array.sort
#   escaped_number = nil
  
#   escaped_number = 1 if array == []
  
#   array.each_with_index do |number, index|
#     if array[0] != 1
#       escaped_number = 1
#       break
#     elsif index == (array.size - 1)
#       escaped_number = number + 1
#       break
#     elsif array[index + 1] != number + 1
#       escaped_number = number + 1
#       break
#     end
#   end
#   p escaped_number
# end

def zoo(array)
  array = array.sort
  
  escaped_number = nil

  if array == [] || array[0] != 1
    escaped_number = 1
  else
    full_range = (1..array[-1]).to_a
    combined_arrays = array + full_range
    unique = combined_arrays.select { |int| combined_arrays.count(int) < 2 }
    if unique == []
      escaped_number = array[-1] + 1
    else
      escaped_number = unique[0]
    end
  end  
  escaped_number
end


p zoo([1, 3, 4])  ==  2
p zoo([1, 2, 3])  ==  4
p zoo([4, 2, 3])  ==  1
# p zoo([])