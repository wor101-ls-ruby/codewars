=begin
**Problem**
Write a function with the signature shown below:

def is_int_array(arr)
  true
end

- returns true / True if every element in an array is an integer or a float with     no decimals.
- returns true / True if array is empty.
- returns false / False for every other input.

Rules:
Explicit
  - Input: an Array
  - Output: a Boolean
  - return true if every element is an integer or a float with no decimals
  - return true if the array is empty
  - otherwise return false

**Examples / Test Cases**



**Data Structures**
- input Array
- output Boolean

**Algorithm**

2. return true if input_array is empty
3. use the all method on the input_array
  - for each element chec to see if it is an integer using #class
    - if it is an integer return true
  - else check to see if it is a float using tthe #class 
    - if it is a float check to see if there is a remainder by seeing if it equals itself converted to an integer
    - if it does return true
  - otherwise return false
=end

def is_int_array(input_array)
  return true if input_array == []
  return false if input_array.class != Array
  
  input_array.all? do |element|
    if element.class == Integer
      true
    elsif element.class == Float && (element == element.to_i)
      true
    else
      false
    end    
  end  
end

p is_int_array([]) == true
p is_int_array([1, 2, 3, 4]) == true
p is_int_array([-11, -12, -13, -14]) == true
p is_int_array([1.0, 2.0, 3.0]) == true
p is_int_array([1, 2, nil]) == false
p is_int_array(nil) == false
p is_int_array("") == false
p is_int_array([nil]) == false
p is_int_array([1.0, 2.0, 3.0001]) == false
p is_int_array(["-1"]) == false
