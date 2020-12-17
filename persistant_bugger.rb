=begin
**Problem**
Write a function, persistence, that takes in a positive parameter num and returns its multiplicative persistence, which is the number of times you must multiply the digits in num until you reach a single digit.


Rules:
Explicit
  - Input: an Integer
  - Output: an Integer
  - return the # of times all the digits must be multiplied together before they return a single digit (using the new product each time)
  - return 0 if input is a one digit number
  - negative #s?

**Examples / Test Cases**
persistence(39) # returns 3, because 3*9=27, 2*7=14, 1*4=4
                 # and 4 has only one digit

 persistence(999) # returns 4, because 9*9*9=729, 7*2*9=126,
                  # 1*2*6=12, and finally 1*2=2

 persistence(4) # returns 0, because 4 is already a one-digit number


**Data Structures**
- input Integer called input_integer
- an Array of digits
- an Integer variable called count (wll be returned)


**Algorithm**
1. intialize an Array variable called digits
  - each element in digits will be a single digit from the input_integer
2. intiazlie a variable called count and set to 0
3. loop until the size of digits is 1
  - create a variable called product and set equal to the prodcut of digits
  - convert product into an array of indiviual numbers and set digits equal to that array
  - increase count by 1
4. return count


=end

def persistence(input_integer)
  digits = input_integer.digits.reverse
  count = 0
  
  until digits.size == 1
    product = digits.reduce(:*)
    digits = product.digits.reverse
    count += 1
  end
  p count
end


p persistence(39) == 3
p persistence(4) == 0
p persistence(25) == 2
p persistence(999) == 4