=begin
**Problem**

Task
Given an integer n, find the maximal number you can obtain by deleting exactly one digit of the given number.


Input/Output
[input] integer n

Constraints: 10 ≤ n ≤ 1000000.

[output] an integer


Rules:
Explicit
  - Input: an Integer 
  - Output: an Integer
  - input will be greater than 10 and less than 1000000

**Examples / Test Cases**
Example
For n = 152, the output should be 52;

For n = 1001, the output should be 101.



**Data Structures**
- input integer called input_integer
- an Array to hold digits called input_digits
- return integer called max_number and set to 0

**Algorithm**
1. intialize an Array variable called input_digits
  - set queal to the individual digits from input_integer (#digits.reverse)
2. intialize an Integer variable called max_numer and set equal to zero
3. iterate through the input_digits using a range from 0 up to but not including the size of input_digits
  - create a new array with all digts except the current one
  - join the new array and convert to an integer and call new-number
  - if the new-nuimber is > than max_number set max_numer equal to new_number
4. return max_number
=end

# def delete_digit(input_integer)
#   input_digits = input_integer.digits.reverse
#   max_number = 0
  
#   (0...input_digits.size).each do |index|
#     new_array = []
#     if input_digits[index + 1] != nil
#       new_array = input_digits[0...index]  + input_digits[(index + 1)..-1]
#     else
#       new_array = input_digits[0...index]
#     end
#     new_number = new_array.join.to_i
#     max_number = new_number if new_number > max_number
#   end
#   p max_number
# end

def delete_digit(input_integer)
  max_number = 0
  
  (0...input_integer.to_s.size).each do |index|
    new_array = input_integer.digits.reverse
    new_array.slice!(index)
    new_number = new_array.join.to_i
    max_number = new_number if new_number > max_number
  end
  p max_number
end



p delete_digit(152) == 52
p delete_digit(1001) == 101
p delete_digit(10) == 1