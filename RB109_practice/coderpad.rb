=begin
**Problem**
You will be given a number and you will need to return it as a string in expanded form. For example:



Note: All numbers will be whole numbers greater than 0.

Rules:
Explicit
  - Input: an Integer
  - Output: a String
  - expand the input integer into a string broken up so:
    - each digit is represented in string form as its value to the 10's place
    - each string digit is combined with each other witht ' + '

**Examples / Test Cases**
expanded_form(12); # Should return '10 + 2'
expanded_form(42); # Should return '40 + 2'
expanded_form(70304); # Should return '70000 + 300 + 4'


**Data Structures**
- input Integer (input_integer)
- output String
- an Array of integers (digits)
- an Array of strings (digit_strings)

**Algorithm**
1. initalize an array called digits 
2. set digits equal to each digit from the input array 
3. intialize an Array varible called digit_strings
4. iterate over digits with index
  - for each digit that is not a 0 convert it to a string called digit_string
    - push to the end of digit_string a number of 0's equal to the size of digits minus index minus 1
    - add the string digit to digit_strings array
5. join the digit_strings array with " + " and return


=end

def expanded_form(input_integer)
  digits = input_integer.digits.reverse
  digit_strings = []
  
  digits.each_with_index do |digit, index|
    if digit == 0
      next
    else
      digit_string = digit.to_s
      digit_string << "0"*(digits.length - index - 1)
      digit_strings << digit_string
    end
  end
  
  p digit_strings.join(" + ")
  
end



p expanded_form(12) == '10 + 2'
p expanded_form(42) == '40 + 2'
p expanded_form(70304) == '70000 + 300 + 4'
