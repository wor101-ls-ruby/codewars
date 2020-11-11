def recover_secret(triplets)
  secret_length = triplets.flatten.uniq.size
  unique_chars = triplets.flatten.uniq
  secret_array = Array.new(secret_length)
  # secret_hash = {}
  hash = {}
  
  unique_chars.each do |char|
    chars_with_greater_index = []
    chars_with_lesser_index = []

    relevant_triplets =  triplets.select { |triplet| triplet.include?(char) }
    relevant_triplets.each do |triplet|
      triplet.each_with_index do |element| 
        if triplet.index(element) > triplet.index(char) 
          chars_with_greater_index << element
        elsif triplet.index(element) < triplet.index(char)
          chars_with_lesser_index << element
        end
      end
    end
    chars_with_greater_index.uniq!
    chars_with_lesser_index.uniq!
    # puts "#{char}: letters afeter = #{chars_with_greater_index}"
    # puts "#{char}: letters before = #{chars_with_lesser_index}"
    hash[char] = [chars_with_greater_index, chars_with_lesser_index]
  end
  
  # p hash
  
  hash2 = {}
  
  unique_chars.each do |char|
    all_chars_with_greater_index = []
    all_chars_with_lesser_index = []
    
    all_chars_with_greater_index << hash[char][0]
    
    hash[char][0].each do |y|
      all_chars_with_greater_index << hash[y][0]
      all_chars_with_greater_index = all_chars_with_greater_index.flatten.uniq
    end
    
    # puts "#{char}: greater index includes #{all_chars_with_greater_index}"
    hash2[char] = all_chars_with_greater_index
  end
  p hash2
  

end

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