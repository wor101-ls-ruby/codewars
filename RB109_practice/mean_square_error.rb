=begin
**Problem**
Complete the function that:

  - accepts two integer arrays of equal length
  - compares the value each member in one array to the corresponding member in the other  
  - squares the absolute value difference between those two values
  - and returns the average of those squared absolute value difference between each member pair.

Rules:
Explicit
  - Input: two Arrays of the same length with integers as elements
  - Output: Integer or floating point number
  - each array is the same length
  - find the difference between each number of the same index
  - square the differences and then get the sum off all the differecnes
  - provide the average 
Implicit
  - absolute valule because you do not know what number will be higher 
  - there are negatives and zeros
  - what to return for empty arrays?

**Examples / Test Cases**
[1, 2, 3], [4, 5, 6]              -->   9   because (9 + 9 + 9) / 3
[10, 20, 10, 2], [10, 25, 5, -2]  -->  16.5 because (0 + 25 + 25 + 16) / 4
[-1, 0], [0, -1]                  -->   1   because (1 + 1) / 2


**Data Structures**
- two arrays with integers
- output integer or float point

**Algorithm**
1. Initaite an Array of length equal to the input arrays - squares
2. iterate through the first input array with index
3. subtract the current integer from the integer at the matching index location in the other array
4. get the absolute value of that interger since it could be negative (#abs)
5. square the absolute value
6. add the absolute value t the squares array at the current index location
7. Once done iterating, sum the squares array and divide by the lenght of the array
8. return the result

=end

def solution(array1, array2)
  squares_array = Array.new(array1.length)
  
  array1.each_with_index do |integer, index|
    squares_array[index] = (integer - array2[index]).abs**2
  end
  p squares_array.sum.to_f / squares_array.length
end


p solution([1, 2, 3], [4, 5, 6]) == 9
p solution([10, 20, 10, 2], [10, 25, 5, -2]) == 16.5
p solution([-1, 0], [0, -1]) ==  1