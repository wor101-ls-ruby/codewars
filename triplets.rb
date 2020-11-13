require 'pry'

# def recover_secret(triplets)
#   secret_length = triplets.flatten.uniq.size
#   unique_chars = triplets.flatten.uniq
#   secret_array = Array.new(secret_length)
#   # secret_hash = {}
#   hash = {}
  
#   unique_chars.each do |char|
#     chars_with_greater_index = []
#     chars_with_lesser_index = []

#     relevant_triplets =  triplets.select { |triplet| triplet.include?(char) }
#     relevant_triplets.each do |triplet|
#       triplet.each_with_index do |element| 
#         if triplet.index(element) > triplet.index(char) 
#           chars_with_greater_index << element
#         elsif triplet.index(element) < triplet.index(char)
#           chars_with_lesser_index << element
#         end
#       end
#     end
#     chars_with_greater_index.uniq!
#     chars_with_lesser_index.uniq!
#     # puts "#{char}: letters afeter = #{chars_with_greater_index}"
#     # puts "#{char}: letters before = #{chars_with_lesser_index}"
#     hash[char] = [chars_with_greater_index, chars_with_lesser_index]
#   end
  
#   # p hash
  
#   hash2 = {}
  
#   unique_chars.each do |char|
#     all_chars_with_greater_index = []
#     all_chars_with_lesser_index = []
    
#     all_chars_with_greater_index << hash[char][0]
    
#     hash[char][0].each do |y|
#       all_chars_with_greater_index << hash[y][0]
#       all_chars_with_greater_index = all_chars_with_greater_index.flatten.uniq
#     end
    
#     # puts "#{char}: greater index includes #{all_chars_with_greater_index}"
#     hash2[char] = all_chars_with_greater_index
#   end
#   p hash2
  

# end

def before_after(character, triplets)
  return_array = [[],[]]
  
  triplets.select { |trip| trip.include?(character) }.each do |triplet|
    triplet.each_with_index do |letter, index|
      if triplet.index(character) < index
        return_array[1] << letter
      elsif triplet.index(character) > index
        return_array[0] << letter
      end
    end
    
  end
return_array[0].uniq!
return_array[1].uniq!
return_array

end

def retrieve_before_letter(hash, current_letter)
  hash[current_letter][0]
end

def retrieve_after_letter(hash, current_letter)
    hash[current_letter][1]
end

def swap_elements(array, index1, index2)
  array[index1], array[index2] = array[index2], array[index1]
end

def recover_secret(triplets)
  secret_length = triplets.flatten.uniq.size
  unique_chars = triplets.flatten.uniq
  
  secret_string = []
  secret_hash = {}

  unique_chars.each do |char|
    secret_string << char
    secret_hash[char] = before_after(char, triplets)

  end
  
  p secret_string
  no_sort = false
  
  12.times do
    
    (secret_length - 1).times do |i|
      current_index = i
      current_letter = secret_string[i]
      next_letter = secret_string[i + 1]
      
      p before_current_letter = retrieve_before_letter(secret_hash, current_letter)
      after_current_letter = retrieve_after_letter(secret_hash, current_letter)
      
      after_next_letter = retrieve_after_letter(secret_hash, next_letter)
      
      before_current_letter.each do |l|
        swap_elements(secret_string, i, secret_string.index(l))
      end

      

      # if current_index < before_current_letter.size
      #   secret_string.insert(current_index + 1, current_letter)
      #   secret_string.delete_at(current_index)
      # end

      # if before_current_letter.include?(next_letter)
      #   swap_elements(secret_string, i, (i + 1))
      # elsif after_next_letter.include?(current_letter)
      #   swap_elements(secret_string, i, (i + 1))
      # end
      
    end
  
    # no_sort = true
  end
  
  
  p secret_string


end

# **New Algorithm**
# 1. determine lenght of secret string
# 2. create new array of length equal to that of the secret strings length
# 3. determine all unique characters
# 4. add all unique characters the to new array
# 5. iterate over each character in the new array
#   - create a hash that stores all characters known to be before or after
#   - create max_index and min_index
#   - min_index equals size of array containing all characters before it
#   - max_index equals size of new array minus size of all characters after
#   - if min_index == max_index then set as final index
# 6. iterate over each index in the return array
#   - check first to see if index is included in final index
#   - if not, check to see which characters could be included
#   - find a way to eliminate multiples




# 1. charaters index is going to equal number of all letters after them -1 
# 2. get all letters by checking each letter known to be afer it for letters known to be after it



# **Algorithm**
# 1. determine lenght of secret string by finding the total number of unique letters  from the input array and turn into its own array
# 2. create a return array with a lenght equal to that of the secret string
# 3. iterate over the array of unique characters
# 4. Create letter_count and start at 0
# 4. for each character iterate over each nested array from the input
#   - create array of letters_with_index_greater than current char
#   - create array of letters_with_index_less than
  - 



secret_1 = "whatisup"
triplets_1 = [
  ['t','u','p'],
  ['w','h','i'],
  ['t','s','u'],
  ['a','t','s'],
  ['h','a','p'],
  ['t','i','s'],
  ['w','h','s']
]

recover_secret(triplets_1) ==  secret_1