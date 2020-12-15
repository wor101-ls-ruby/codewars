=begin
**Problem**
Every positive integer can be written as a sum of Fibonacci numbers. 
For example 10 = 8 + 2 or 5 + 3 + 2 or 3 + 3 + 2 + 2. 
Apparently, this representation is not unique.

It becomes unique, if we rule out consecutive Fibonacci numbers: this is Zeckendorf's theorem, first proven by Lekkerkerker in 1952. 
In the example above, this excludes the last two representations (containing the consecutive Fibonacci numbers 2 and 3), 
and we are left with the Zeckendorf representation 10 = 8 + 2.

Complete the function that returns the Zeckendorf representation of a given integer n as a list of Fibonacci numbers in decreasing order. Return an empty list for n = 0 and None/nil for negative n.

Rules:
Explicit
  - Input: an Integer
  - Output: an Array of integers, empty array or nil
  - return the numbers from the fibonacci sequence whose sum is the input Integer
  - they CANNOT be consecutive within the fibonacci sequence
  - return the numbers in an array from highest to lowest
  - if the input is 0 return an empty array
  - if the input is negative return nil

**Examples / Test Cases**



**Data Structures**
- input integer
- output Array

**Algorithm**
1. initalize an array called fib_numbers to hold the fibonacci numbers
2. set the array equal to the return of generate_fibs 
  - generate_fibs will accept one parameterm, the input_integer
  - generate_fibs will return an array of fibonnaci #s 
    - start at beginning of sequence and generate up to input_integer
    - start array with [1, 1] 
    - until the last added # is equal to or greater than input_integer
    - add the last 2 numbers in the array and push result to the array
  - return the array of fib #'s
3. Reverse the fib_numbers array
4. Iterate over the fib_numbers
  - intialize variable called current_total
  - intialize current_nums
  - loop until current_total is >= input_integer
    - skip the element after the first and iterate over remaining portion of fib_numbers 
    - add each number to current total
      if current_total is less than input_integer then add to current_nums
      if current_total is greater than input_integer then subtract from current_total and go to next number
      if current_total equals input_integer then break and retrun current_nums
    - if this fails 
    

=end

def generate_fibs(input_integer)
  fib_numbers = [1, 1]
  
  loop do 
    next_fib = fib_numbers[-2] + fib_numbers[-1]
    next_fib <= input_integer ? fib_numbers << next_fib : break
  end
  fib_numbers
end


def zeckendorf(input_integer)
  fib_numbers = generate_fibs(input_integer).reverse
  
  zek_nums = [fib_numbers.shift]
  current_total = zek_nums.sum
  
  return [] if input_integer == 0
  return nil if input_integer < 0

  fib_numbers.each_with_index do |fib, index|
    if fib_numbers.include?(input_integer - current_total) && fib != fib_numbers[index - 1]
      zek_nums << (input_integer - current_total)
      break
    elsif current_total + fib <= input_integer && fib != fib_numbers[index - 1]
      current_total += fib
      zek_nums << fib
    end
  end
   p zek_nums
end



p zeckendorf(10) == [8, 2]
p zeckendorf(100) ==  [89, 8, 3]
p zeckendorf(1) == [1]
p zeckendorf(0) == []
p zeckendorf(-1) == nil
p zeckendorf(2) == [2]