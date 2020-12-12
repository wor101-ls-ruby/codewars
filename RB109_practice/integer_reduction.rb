=begin
**Problem**
In this Kata, you will be given two integers n and k and your task is to remove k-digits from n and return the lowest number possible, without changing the order of the digits in n. Return the result as a string.

Let's take an example of solve(123056,4). We need to remove 4 digits from 123056 and return the lowest possible number. The best digits to remove are (1,2,3,6) so that the remaining digits are '05'. Therefore, solve(123056,4) = '05'.

Note also that the order of the numbers in n does not change: solve(1284569,2) = '12456', because we have removed 8 and 9.

More examples in the test cases.

Rules:
Explicit
  - Input: two Integers
  - Output: a String representing a new integer
  - the second input represents the number of digits that must be removed from the first string
  - create the smallest integer possible by removing that many digits without changing the order
  - a resulting number CAN start with 0 and that is valid
**Examples / Test Cases**



**Data Structures**
- two input Integers (integer1, remove)
- an Array of digits
- return string

**Algorithm**
1. intialize an Array variable called digits and set equal to the digits in the integer1
2. iterate over digits a number of times equal to remove
  - each iterate check to see if the digit to the right of the current digit is less than the current digit
  - if it is less than the current digit, remove the current digit from the digits array and stop current iteration
  - repeat loop until a number of digits equal to remove has been removed from digits
3. use the destruive form of map! to transform each digit into a string version of itself
4. use the join method and return the resultant string 

=end

def solve(integer1, remove)
  digits_array = integer1.digits.reverse
  
  remove.times do     
    digits_array.each_with_index do |digit, index|      
      if digits_array[index + 1] != nil && digit > digits_array[index + 1]
        digits_array.delete_at(index)
        break
      elsif digits_array[index + 1] == nil
        digits_array.delete_at(index)
        break
      end
    end    
  end
  
  digits_array.map! { |digit| digit.to_s }
  digits_array.join  
end




p solve(123056,1) == '12056'
p solve(123056,2) == '1056'
p solve(123056,3) == '056'
p solve(123056,4) =='05'
p solve(1284569,1) =='124569'
p solve(1284569,2) == '12456'
p solve(1284569,3) == '1245'
p solve(1284569,4) == '124'