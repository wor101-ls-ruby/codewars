=begin
**Problem**
If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.

Finish the solution so that it returns the sum of all the multiples of 3 or 5 below the number passed in.

Note: If the number is a multiple of both 3 and 5, only count it once. Also, if a number is negative, return 0(for languages that do have them)


Rules:
Explicit
  - Input: an Integer 
  - Output: an Integer
  - return the sum of all the multiples of 3 and 5 below the input_integer
  - if a number is a multiple of both 3 and 5 only count it once
  

**Examples / Test Cases**
 all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.


**Data Structures**
- input integer
- -output integer
- an array of integers


**Algorithm**
1. initialize an Array called multiples
2. create a range from 2 up to but not including the input_integer
3. iterate over the range using the current value as current_integer
  - if current integer % 3 equals 0  add it to the multiples array
  - if current integer % 5 equals 0 and multiples does not include integer add it to multiples array
4. return the sum of multiples

=end

def solution(input_integer)
  multiples = []
  
  (2...input_integer).each do |current_integer|
    multiples << current_integer if current_integer % 3 == 0
    multiples << current_integer if current_integer % 5 == 0 && multiples.include?(current_integer) == false
  end
  p multiples.sum
  
end

p solution(10) == 23
p solution(20) == 78
p solution(200) == 9168
