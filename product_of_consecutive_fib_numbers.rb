=begin
**Problem**
The Fibonacci numbers are the numbers in the following integer sequence (Fn):
  0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, ...
such as:
  F(n) = F(n-1) + F(n-2) with F(0) = 0 and F(1) = 1.

Given a number, say prod (for product), we search two Fibonacci numbers F(n) and F(n+1) verifying
  F(n) * F(n+1) = prod.

Your function productFib takes an integer (prod) and returns an array:
  [F(n), F(n+1), true]

If you don't find two consecutive F(m) verifying F(m) * F(m+1) = prodyou will return
  [F(m), F(m+1), false]

F(m) being the smallest one such as F(m) * F(m+1) > prod.

Rules:
Explicit
  - Input: Integer
  - Output: Array of two integers and a boolean
  - Boolean is determined by if two sequential numbers from the Fibonacci sequence can be multiplied to get the input integer
  - return those two numbers and boolean if true
  - return the first two numbers whose product is greater than the input and false otherwise

**Examples / Test Cases**
productFib(714) # should return (21, 34, true), 
                # since F(8) = 21, F(9) = 34 and 714 = 21 * 34

productFib(800) # should return (34, 55, false), 
                # since F(8) = 21, F(9) = 34, F(10) = 55 and 21 * 34 < 800 < 34 * 55
-----
productFib(714) # should return [21, 34, true], 
productFib(800) # should return [34, 55, false], 
-----
productFib(714) # should return {21, 34, 1}, 
productFib(800) # should return {34, 55, 0},        
-----
productFib(714) # should return {21, 34, true}, 
productFib(800) # should return {34, 55, false}, 

**Data Structures**
- Array of fibonnaci numbers
- input integer
- Return array [int1, int2, boolean]
- first_number integer
- second_number integer
- boolean

**Algorithm**
1. create an Array of fibonacci #'s up to the sqrt of the input integer
2. create return array of 3 elements
3. iterate over the array of fibonacci #'s with index
4. for each number check if it * the next # equalss the input integer
4. if yes set return array to equal [current integer, next integer, true] and break
5. else if product is greater than input integer then set return array to [current integer, next integer, false] and break
6. return array of 3 elmeents
=end

def create_fibonacci(max)
  array = [0, 1]
  
  current_index = 2
  until array.last >= max
    array << (array[current_index - 1] + array[current_index - 2])
    current_index += 1
  end
  array 
end

def productFib(product)
  fibonacci_numbers = create_fibonacci(product)
  return_array = [nil, nil, nil]
  
  fibonacci_numbers.each_with_index do |integer, index|
    if integer * fibonacci_numbers[index + 1] == product
      return_array = [integer, fibonacci_numbers[index + 1], true]
      break
    elsif integer * fibonacci_numbers[index + 1] > product
      return_array = [integer, fibonacci_numbers[index + 1], false]
      break
    end
  end
  p return_array
end


p productFib(714) == [21, 34, true] 
p productFib(800) == [34, 55, false]