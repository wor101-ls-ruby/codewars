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
1. initialize an Array named words to hold each word
2. create a loop that continues until the words array is only 1 element in size
  - reverse each word in the array
  - send array to new method called combine_words
  - set words array to equal the return of combine_words
3. return the single element as a strin from words array

**combine_words Algorithm**
1. accepts one parameter called words which is an Array
2. create a return_array that is empty
2. find the size of the array
3. create a range from 0 up to but not includng the size of the array
4. iterate over the range using the #each method and the current number will be called index
5. if the current index is even && the next index != nil then join current index with next index and add to return_array
6. if the next index == nil then add element at current index to return_array
7  return_array
=end

def combine_words(words)
  return_words = []
  
  (0...words.size).each do |index|
    if index.even? && words[index + 1] != nil
      return_words << (words[index] + words[index + 1])
    elsif index.even? && words[index + 1] == nil
      return_words << words[index]
    end
  end
  return_words
end


def reverse_and_combine_text(input_string)
  words = input_string.split

  return words[0] if words.size == 1 
  
  until words.size == 1
    words.map! { |word| word.reverse }
    words = combine_words(words)
  end
  
  p words[0]
end


p reverse_and_combine_text("abc def") == "cbafed"
p reverse_and_combine_text("abc def ghi jkl") == "defabcjklghi"
p reverse_and_combine_text("dfghrtcbafed") == "dfghrtcbafed"
p reverse_and_combine_text("234hh54 53455 sdfqwzrt rtteetrt hjhjh lllll12  44") == "trzwqfdstrteettr45hh4325543544hjhjh21lllll"
p reverse_and_combine_text("sdfsdf wee sdffg 342234 ftt") ==  "gffds432243fdsfdseewttf"