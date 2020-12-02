=begin
**Problem**
Given two arrays a and b write a function comp(a, b) (compSame(a, b) in Clojure) that checks whether the two arrays have the "same" elements, with the same multiplicities. "Same" means, here, that the elements in b are the elements in a squared, regardless of the order.

Rules:
Explicit
  - Input: two Arrays of Integers
  - Output: boolean
  - if the elements in the second Array are squared versions of the elements of the first array return ture
Implied
  - are both arrays of equal size?
  - does every element in the first array have to have a squared version in the second?


**Examples / Test Cases**
  comp( [121, 144, 19, 161, 19, 144, 19, 11], 
        [11*11, 121*121, 144*144, 19*19, 161*161, 19*19, 144*144, 19*19]) ==  true

**Data Structures**
- input arrays of integers
- output boolean

**Algorithm**
1. iterate over the 1st array
2. square each element and check to see if the result is in the second array
3. if it is not reutrn false
4. otherwise return true after checking every element

1. iterate over the 2nd array
2. find the square root for each element in the 2nd array\
3. convert the square root to an integer 
4. check to confirm square root is included in the first array
5. if not then return false

=end

def confirm_int (number)
  if number == 0 || number % number.to_i == 0
    true
  else 
    false
  end
end

def comp(array1, array2)
  same = true
  
  if array1 == nil || array2 == nil
    return false
  end
  
  array2.each do |number|
    if array1.size == 0
      same = false
      break
    elsif confirm_int(Math.sqrt(number)) && array1.include?(Math.sqrt(number).to_i) 
      array1.slice!(array1.index(Math.sqrt(number).to_i))
      next
    else
      same = false
      break
    end
  end
  same
  
end

p comp( [121, 144, 19, 161, 19, 144, 19, 11], 
        [11*11, 121*121, 144*144, 19*19, 161*161, 19*19, 144*144, 19*19]) ==  true