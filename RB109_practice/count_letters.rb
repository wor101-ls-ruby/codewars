=begin
**Problem**
In this kata, you've to count lowercase letters in a given string and return the letter count in a hash with 'letter' as key and count as 'value'. 
The key must be 'symbol' instead of string in Ruby and 'char' instead of string in Crystal.

Rules:
Explicit
  - Input: String
  - Output: hash
  - count only lowercase letters in the string
  - add letter count as value to a hash
  - the key should be the symbol representation of the letter
Implicit
  - any non-alphanumberic characters?
  - are there uppercase characters?

**Examples / Test Cases**
letterCount('arithmetics') == {:a=>1, :c=>1, :e=>1, :h=>1, :i=>2, :m=>1, :r=>1, :s=>1, :t=>2}
letter_count('codewars') == {:a=>1, :c=>1, :d=>1, :e=>1, :o=>1, :r=>1, :s=>1, :w=>1})
letter_count('activity') ==  {:a=>1, :c=>1, :i=>2, :t=>2, :v=>1, :y=>1})
letter_count('arithmetics') == {:a=>1, :c=>1, :e=>1, :h=>1, :i=>2, :m=>1, :r=>1, :s=>1, :t=>2})


**Data Structures**
- input string
- output hash { a: 1, b: 1, e: 1 } 
- an array ['a', 'b', 'e']

**Algorithm**
1. Initialize an array
2. Set the array equal to the characters from the input string by calling the #chars method on string
3. set the array to only the lowercase letters using the #select method and regexp
4. initialize a hash
5. iterate over the array of characters
  - if the hash contains the character as a symbol (#to_sym) then increase value by 1
  - else add the symbol version of te character and set the value to 1
6. return the hash

=end

def letter_count(string)
  letters_array = string.chars.select { |letter| letter.match?(/[a-z]/) }
  letters_hash = {}
  
  letters_array.each do |letter|
    if letters_hash.include?(letter.to_sym)
      letters_hash[letter.to_sym] += 1
    else 
      letters_hash[letter.to_sym] = 1
    end
  end
  letters_hash
end





p letter_count('arithmetics') == {:a=>1, :c=>1, :e=>1, :h=>1, :i=>2, :m=>1, :r=>1, :s=>1, :t=>2}
p letter_count('codewars') == {:a=>1, :c=>1, :d=>1, :e=>1, :o=>1, :r=>1, :s=>1, :w=>1}
p letter_count('activity') ==  {:a=>1, :c=>1, :i=>2, :t=>2, :v=>1, :y=>1}
p letter_count('arithmetics') == {:a=>1, :c=>1, :e=>1, :h=>1, :i=>2, :m=>1, :r=>1, :s=>1, :t=>2}