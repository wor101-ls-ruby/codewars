=begin
**Problem**
Write a function

triple_double(num1, num2)

which takes numbers num1 and num2 and returns 1 if there is a straight triple of a number at any place in num1 and also a straight double of the same number in num2.

If this isn't the case, return 0


Rules:
Explicit
  - Input: two Integers
  - Output: Integer of either 1 or 0
  - return 1 if:
    - first number includes 3 consecutive numbers that are the same
    - the second contains 2 consecutive numbers identical to the first 
  - otherwise return 0

**Examples / Test Cases**

triple_double(451999277, 41177722899) == 1
# num1 has straight triple 999s and  num2 has straight double 99s

triple_double(1222345, 12345) == 0
# num1 has straight triple 2s but num2 has only a single 2

triple_double(12345, 12345) == 0

triple_double(666789, 12345667) == 1


**Data Structures**
- input Integers
- output Integer of either 1 or 0


**Algorithm**
1. create an Array of digits from integer1 called interger1_digits
2. create an String called integer2_string and set equal to the string version of integer2
3. iterate over integer1_digits with index
  - create a variable called current_triple and set to nil
  - for each digit check to see if it is equal to the next two digits
    - if true
      - then set current_triple to equal the digit as a string added to itself
      - if integer2_string #include? current_triple return 1
4. return 0

=end

def triple_double(integer1, integer2)
  integer1_digits = integer1.digits.reverse
  integer2_string = integer2.to_s
  
  integer1_digits.each_with_index do |digit, index|
    break if integer1_digits[index + 2] == nil
   
    if digit == integer1_digits[index + 1] && digit == integer1_digits[index + 2]
      return 1 if integer2_string.include?(digit.to_s*2)
    end    
  end
  0
end

p triple_double(451999277, 41177722899) == 1
p triple_double(1222345, 12345) == 0
p triple_double(12345, 12345) == 0
p triple_double(666789, 12345667) == 1
p triple_double(10560002, 100) == 1
p triple_double(1112, 122) == 0