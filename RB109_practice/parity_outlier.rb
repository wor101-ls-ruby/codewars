=begin
**Problem**
You are given an array (which will have a length of at least 3, but could be very large) containing integers. 
The array is either entirely comprised of odd integers or entirely comprised of even integers except for a single integer N. 
Write a method that takes the array as an argument and returns this "outlier" N.


Rules:
Explicit
  - Input: an Array
  - Output: an Integer
  - input array will be at least 3 elements in size
  - all elements are either odd or even except for one
  - return the outlier

**Examples / Test Cases**
[2, 4, 0, 100, 4, 11, 2602, 36]
Should return: 11 (the only odd number)

[160, 3, 1719, 19, 11, 13, -21]
Should return: 160 (the only even number)

**Data Structures**
- input array of integers
- output integer


**Algorithm**
1. If the input array contains more than 1 odd # then evens are the outlier
2. If the input array contains more than 1 evene # then odds are the outlier
3. use the select method to return the outlier
4. return the Integer value of the only element returned by the select method

1. collect all the odds using #select and the #odd? method
2. collect all the evens using the #select and the #even? method
3. if the odds array is size 1 return the vale of the first element
4. otherwise return the value of the first element in the evens array


=end

def find_outlier(array)
  odds = array.select { |int| int.odd? }
  evens = array.select { |int| int.even? }

  odds.size == 1 ? odds[0] : evens[0]

end




p find_outlier([0, 1, 2]) == 1
p find_outlier([1, 2, 3]) == 2
p find_outlier([2,6,8,10,3]) == 3
