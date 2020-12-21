=begin
**Problem**
Complete the function that

  - accepts two integer arrays of equal length
  - compares the value each member in one array to the corresponding member in the other
  - squares the absolute value difference between those two values
  - and returns the average of those squared absolute value difference between each member pair.
Examples:


Rules:
Explicit
  - Input: two Arrays of equal length with Integers as elements
  - Output: an Integer or Float
  - find the absolute value difference between the elements at the same indexes in both arrays
  - square each differeence
  - find the average of the squares and return it

**Examples / Test Cases**

[1, 2, 3], [4, 5, 6]              -->   9   because (9 + 9 + 9) / 3
[10, 20, 10, 2], [10, 25, 5, -2]  -->  16.5 because (0 + 25 + 25 + 16) / 4
[-1, 0], [0, -1]                  -->   1   because (1 + 1) / 2

**Data Structures**
- input Arrays array1, array 2
- output Float called average_of_squares
- an Array of squared_differences

**Algorithm**
1 initialize an Array variable called squared_differences
2. create a range from 0 up to but not including the size of array1
3. iterate over the range using the current range as index
  - subtract the element at current index from array1 from array2
  - get the absolute value of that number and square it
  - add the squared value to the squared_differences array
4. find the sum of all the values in squared_differences
5. divide sum by the number of elements in squared_difference and return the result (convert to foat?)

=end

def solution(array1, array2)
  squared_differences = []
  
  (0...array1.size).each do |index|
    absolute_value = (array1[index] - array2[index]).abs
    squared_differences << absolute_value**2    
  end
  
  p (squared_differences.sum / squared_differences.size.to_f) 
  
end


p solution([1, 2, 3], [4, 5, 6]) == 9
p solution([10, 20, 10, 2], [10, 25, 5, -2]) == 16.5
p solution([-1, 0], [0, -1]) == 1