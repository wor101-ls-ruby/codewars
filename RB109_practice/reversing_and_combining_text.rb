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
  - takes words in pairs reverses the letters in each word and combines them
  - continues to do so until no more pairs, or if odd, one remains
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
1. Create array of words split by whitespace
2. Create new Array of reversed and joined words
3. If the size of the words array is 1 return a string version of the 1 elment
4. Destructively take the first two elements
5. reverse the string in each element and then join the elments
6. add the newly reversed/joined string to the return array
7. if the words arrays size is greater than 0 then pass it to the method again

=end
require 'pry'

def reverse_and_combine_text(input_string)
  words_array = input_string.split(' ')
  words_array.map { |word| word.reverse! }
  reversed_and_joined = []

  return input_string if words_array.size == 1
  
  reversed_and_joined << words_array.shift(2).join
  
  until reversed_and_joined.size == 1 && words_array.size == 0
  # binding.pry
    if words_array.size > 0
      # binding.pry
      reversed_and_joined << reverse_and_combine_text(words_array.shift(2).join(' '))
    elsif reversed_and_joined.size > 1
      # binding.pry
      reversed_and_joined = [reverse_and_combine_text(reversed_and_joined.join(' '))]
    end
  end
  p reversed_and_joined[0]
end


# p reverse_and_combine_text("abc def") == "cbafed"
p reverse_and_combine_text("abc def ghi jkl") == "defabcjklghi"
# p reverse_and_combine_text("dfghrtcbafed") == "dfghrtcbafed"
# p reverse_and_combine_text("234hh54 53455 sdfqwzrt rtteetrt hjhjh lllll12  44") == "trzwqfdstrteettr45hh4325543544hjhjh21lllll"
# p reverse_and_combine_text("sdfsdf wee sdffg 342234 ftt") ==  "gffds432243fdsfdseewttf"