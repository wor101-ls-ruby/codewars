def find_numeric_end(string)
  numeric_characters = []
  array = string.chars
  array.reverse!
  
  if string == ''
    return []
  end
  
  index = 0
  until index == (string.size)
    if array[index].match?(/\d/)
      numeric_characters << array[index]
    else
      break
    end
    index += 1 
  end
  numeric_characters.reverse  
end

def increment_string(string)
  original_array = string.chars 
  numeric_characters = find_numeric_end(string)
  non_numeric_characters = original_array.select { |char| numeric_characters.include?(char) == false }
  
  if numeric_characters == []
    p string + '1'
  else
    zeros = numeric_characters.select { |num| num == '0' }
    number_length = numeric_characters.size
    new_number = (numeric_characters.join.to_i + 1).to_s
    
    if zeros != []
      new_number = '0'*(number_length - new_number.size ) + new_number
    end
  p non_numeric_characters.join + new_number
  end
end


# **Algorthim**
# 1. turn string into an array of characters
# 2. select all characters that contain numbers
# 3. if no characters contain numbers 
#   -  add 1 to end of the array
#   -  rejoin the array into an integer and return
# 4. rejoin characters containing numbers into an integer
# 5. increase integer by 1
# 6. replace original characters at end of string with new integer characters


p increment_string("foo") == "foo1"
p increment_string("foobar001") == "foobar002"
p increment_string("foobar1") == "foobar2"
p increment_string("foobar00") == "foobar01"
p increment_string("foobar99") == "foobar100"
p increment_string("") == "1"