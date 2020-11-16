=begin
**Problem**
You are given array of integers, your task will be to count all pairs in that array and return their count.

Notes:

Array can be empty or contain only one value; in this case return 0
If there are more pairs of a certain number, count each pair only once. E.g.: for [0, 0, 0, 0] the return value is 2 (= 2 pairs of 0s)
Random tests: maximum array length is 1000, range of values in array is between 0 and 1000

Rules:
Explicit
  - Input: Array of integers
  - Output: Integer
  - input array can be empty => return 0
  - input array can have only one value => return 0
  - count all pairs and return the total number of pairs
  - can be multiple pairs of the same number, count each
  - array lenght is between 0 and 1000

**Examples / Test Cases**
pairs([1, 2, 5, 6, 5, 2] == 2
pairs([1, 2, 2, 20, 6, 20, 2, 6, 2] ==  4
pairs([0, 0, 0, 0, 0, 0, 0] == 3 
pairs([1000, 1000] == 1
pairs([]) == 0
pairs([54]) == 0

**Data Structures**
- Input array
- Output integer

**Algorithm**
1. Initialize an Integer variable called pairs and set it equal to 0
2. Initialize an Array variable called unique_numbers and set it equal to only the unique numbers from the input array
3. iterate over unique_numbers
4. for each number check how many are incuded in the input array and divide by 2
5. add the result to the pairs variable
6. return pairs

=end

def pairs(array)
  pairs = 0
  array.uniq.each { |number| pairs += array.count(number) / 2 }
  pairs
end

p pairs([1, 2, 5, 6, 5, 2]) == 2
p pairs([1, 2, 2, 20, 6, 20, 2, 6, 2]) ==  4
p pairs([0, 0, 0, 0, 0, 0, 0]) == 3 
p pairs([1000, 1000]) == 1
p pairs([]) == 0
p pairs([54]) == 0