=begin
**Problem**
Your task is to Reverse and Combine Words. It's not too difficult, but there are some things you have to consider...

So what to do?
Input: String containing different "words" separated by spaces

1. More than one word? Reverse each word and combine first with second, third with fourth and so on...
   (odd number of words => last one stays alone, but has to be reversed too)
2. Start it again until there's only one word without spaces
3. Return your result...

Rules:
Explicit
  - Input: A string of words separated by spaces
  - Output: a string 
  - words are separated by white space
  - reverse each word and combine in pairs (1 with 2, 3 with 4)
  - repeat until there are no spaces left
Implicit
  - a single word is not reversed
  - if an odd number of words, last word stays alone but must be reversed

**Examples / Test Cases**
Input:  "abc def"
Output: "cbafed"

Input:  "abc def ghi 123"
Output: "defabc123ghi"

Input:  "abc def gh34 434ff 55_eri 123 343"
Output: "43hgff434cbafed343ire_55321"

**Data Structures**
- Input string
- output string
- An array of words delimited by whitespace

**Algorithm**
1. split the input string into an array by whitespace
2. if arrays size is 1 then turn array to a string and return it
3. store size of the array as an integer
4. counter to keep track of index
5. loop until we reach final index of the array
6. take first two elements and reverse each
7. then combine those two elements into one
8. increase our counter by 2
9. turn array into string and return

=end

def two_elements_switch(element1, element2)
  element1.reverse!
  element2.reverse!
  element1 + element2
end


# def reverse_and_combine_text(input_string)
#   words_array = input_string.split(' ')
#   array_size = words_array.size
#   index_counter = 0
  
#   return input_string if array_size == 1
  
#   loop do
#     if index_counter < array_size - 2
#       new_element = two_elements_switch(words_array[index_counter], words_array[index_counter + 1])
#       2.times { |_| words_array.shift }
#       words_array.unshift(new_element)
#       index_counter += 1
#     elsif index_counter == array_size - 1
#       words_array[index_counter].reverse!
#       index_counter += 1 
#     end
    
#     break if index_counter > array_size
#   end
  
#   p words_array
# end

def combine_elements(element1, element2)
  
end

def reverse_and_combine_text(input_string)
  words_array = input_string.split(' ').map { |word| word.reverse }
  return_array = []
  
  return input_string if words_array.size == 1
  
  words_array.each_with_index do |word, index|
    
    
    
  end
  

  
end

p reverse_and_combine_text("abc def") == "cbafed"
p reverse_and_combine_text("abc def ghi jkl") == "defabcjklghi"
p reverse_and_combine_text("dfghrtcbafed") == "dfghrtcbafed"
p reverse_and_combine_text("234hh54 53455 sdfqwzrt rtteetrt hjhjh lllll12  44") == "trzwqfdstrteettr45hh4325543544hjhjh21lllll"
p reverse_and_combine_text("sdfsdf wee sdffg 342234 ftt") ==  "gffds432243fdsfdseewttf"