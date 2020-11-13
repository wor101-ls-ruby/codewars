**Problem**
Divisors of 42 are : 1, 2, 3, 6, 7, 14, 21, 42. 
These divisors squared are: 1, 4, 9, 36, 49, 196, 441, 1764. 
The sum of the squared divisors is 2500 which is 50 * 50, a square!

Given two integers m, n (1 <= m <= n) we want to find all integers between m and n whose sum of squared divisors is itself a square. 
42 is such a number.

The result will be an array of arrays or of tuples (in C an array of Pair) or a string, each subarray having two elements, 
first the number whose squared divisors is a square and then the sum of the squared divisors.

Rules:
Explicit
  - Input: two integers
  - Output: An array of arrays - each sub array has 2 elements that are integers
  - both input integers will be >= 1
  - find all integers before 1st and 2nd input integer whos sum of squared divisors is a square

**Examples / Test Cases**
list_squared(1, 250) == [[1, 1], [42, 2500], [246, 84100]]
list_squared(42, 250) == [[42, 2500], [246, 84100]]
list_squared(1, 250) == [[1, 1], [42, 2500], [246, 84100]]
list_squared(42, 250) == [[42, 2500], [246, 84100]]
list_squared(250, 500) == [[287, 84100]]

**Data Structures**
- Input integers
- Output array  [[1, 1], [42, 2500], [246, 84100]]
- 

**Algorithm**
1. Create a range starting at first input integer and going to second input integer
2. for each integer in the range 
  - find all divisors of that integer
  - add all divisors together
  - if the sum of divisors is a square add it and the sum to the return array
3. return final array

**Algorithm - Divisors**
1. Create current_divsor variable and set equal to input integer
2. Create array to hold divsors
3. use #times method on current_divsor
  - check if the input integer divided by current_divsor has a remainder
  - if no remainder then add current_divsor to array of divisors
  - current_divsor -= 1
4. return array of divsors