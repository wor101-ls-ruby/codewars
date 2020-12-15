=begin
**Problem**
Assume "#" is like a backspace in string. This means that string "a#bc#d" actually is "bd"

Your task is to process a string with "#" symbols.

Rules:
Explicit
  - Input: a String
  - Output: a String
  - # acts as a backspace / delete the previous character from the string
  - this can result in an empty string to be returned
  
  
**Examples / Test Cases**
"abc#d##c"      ==>  "ac"
"abc##d######"  ==>  ""
"#######"       ==>  ""
""              ==>  ""


**Data Structures**
1. input STring
2. output STring
**Algorithm**
1. intialize return_string and setting to an empty string
2. intialize backspace and set equal to the count of '#' in input_string
3. return return_string if backspace >= half the size of input_string
4. reverse the string in reverse_string
5. creat a count variable
5. iterate through the reverse_string
  - if current character is '#' add one to count
  - elsif count > 0 
    - subtract 1 from count
    - go to the next character
  -elsif count == 0
    - add current character to return string
6. reverse the return_string
7. return the return_string


=end

def clean_string(input_string)
  return_string = ''

  reverse_string = input_string.reverse
  count = 0
  reverse_string.chars.each do |character|
    if character == '#'
      count += 1
    elsif count > 0 
      count -= 1
    else
      return_string += character
    end
  end
  
  return_string.reverse
end



p clean_string('abc#d##c') == "ac"
p clean_string('abc####d##c#') == "" 
p clean_string('####gfdsgf##hhs#dg####fjhsd###dbs########afns#######sdanfl##db#####s#a') == 'sa'
