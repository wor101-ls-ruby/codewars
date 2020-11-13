def rot13(string)
  cypher = string.chars.map do |char|
      if char.match?(/[a-zA-Z]/)
        cypherd_char = char
        13.times { |_| cypherd_char.succ! }
        # puts "Original letter: #{char}"
        # puts "Cyphered letter: #{cypherd_char}"
        cypherd_char.size > 1 ? cypherd_char[1] : cypherd_char
      else
         char
      end
    end
  cypher.join
end







# **Algorithm**
# 1. create new string to be returned
# 2. iterate over each character in the string
# 3. if the character is not alphabetic add it to the new string
# 4. if the character is alphabetic add the letter 13 letters after it to the new string (String#succ)
# 5. return new string 



p "grfg" == rot13("test")
p "Grfg" == rot13("Test")
p rot13('123$%') 