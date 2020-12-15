=begin
**Problem**
Complete the greatestProduct method so that it'll find the greatest product of five consecutive digits in the given string of digits.

The input string always has more than five digits.

Rules:
Explicit
  - Input: a string of digits
  - Output: an Integer
  - return the greatest product that can be created from five consecutive digits

**Examples / Test Cases**
greatestProduct("123834539327238239583") // should return 3240


**Data Structures**
1. Input String
2. Output Integer


**Algorithm**
1. create an Array called digits 
  - turn the input_string into an integer
  - use the digits method to turn it into an array of digits
  - use the reverse method to put it into its original order
2. intialize a variable called product and set equal to 0
3. create a range from 0...(input_strin.size - 5) and iterate over it with # each method
  - use current number as index
  - currrent_pruduct equals get_product from digits[index..(index +  5)] i
  - if the current_product is greater than the product set product equal to current product
4. return product
  
  
  
**get_product Algortihm**
1. accept an array of integers
2. create produt variable and set to 0
3. iterate over array
  - for each element set the product equal to the product times the current element
4. return the product
=end

def get_product(array)
  product = 1
  
  array.each { |int| product *= int }
  product
end

def greatest_product(input_string)
  digits = input_string.chars.map { |digit| digit.to_i }
  product = 0
  
  (0..(input_string.size - 5)).each do |index|
    # current_product = get_product(digits[index..(index + 4)])
    current_product = digits[index..(index + 4)].reduce(:*)
    product = current_product if current_product > product
  end
  
  p product
end

# p get_product([1,2,3,8,3])


p greatest_product("123834539327238239583") == 3240
p greatest_product("395831238345393272382") == 3240
p greatest_product("92494737828244222221111111532909999") == 5292
p greatest_product("92494737828244222221111111532909999") == 5292
p greatest_product("02494037820244202221011110532909999") == 0