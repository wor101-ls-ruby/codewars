=begin
**Problem**

Some numbers have funny properties. For example:

89 --> 8¹ + 9² = 89 * 1

695 --> 6² + 9³ + 5⁴= 1390 = 695 * 2

46288 --> 4³ + 6⁴+ 2⁵ + 8⁶ + 8⁷ = 2360688 = 46288 * 51

Given a positive integer n written as abcd... (a, b, c, d... being digits) and a positive integer p

we want to find a positive integer k, if it exists, such as the sum of the digits of n taken to the successive powers of p is equal to k * n.
In other words:

Is there an integer k such as : (a ^ p + b ^ (p+1) + c ^(p+2) + d ^ (p+3) + ...) = n * k

If it is the case we will return k, if not return -1.

Note: n and p will always be given as strictly positive integers.



Rules:
Explicit
  - Input: 
  - Output: 

**Examples / Test Cases**
dig_pow(89, 1) should return 1 since 8¹ + 9² = 89 = 89 * 1
dig_pow(92, 1) should return -1 since there is no k such as 9¹ + 2² equals 92 * k
dig_pow(695, 2) should return 2 since 6² + 9³ + 5⁴= 1390 = 695 * 2
dig_pow(46288, 3) should return 51 since 4³ + 6⁴+ 2⁵ + 8⁶ + 8⁷ = 2360688 = 46288 * 51


**Data Structures**
- first parameter Integer called main_number
- second parameter Integer called start_power
- output Integer
- an Array of digits called main_number_array

**Algorithm**
1. initialize a variable called main_number_array
2. set main_number_array where each element is an integer digit from main_number
3. initialize a variable called power and set to start_power
3a. initialize a variable called total
4. iterate over main_number_array
  - for each digit raise it to the power
  - add the result to total
  - increase power by 1
5. see if total is divisible by the main_number without leaving a remainder
  - if so the divide by main_number and return the result
  - otherwise return -1

=end

def dig_pow(main_number, start_power)
  main_number_array = main_number.digits.reverse
  power = start_power
  total = 0
  
  main_number_array.each do |digit|
    total += digit**power
    power += 1
  end
  
  if total % main_number == 0
    total / main_number
  else
    -1
  end  
end


p dig_pow(89, 1) == 1
p dig_pow(92, 1) == -1
p dig_pow(46288, 3) == 51