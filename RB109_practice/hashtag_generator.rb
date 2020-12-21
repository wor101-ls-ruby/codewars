=begin
**Problem**

The marketing team is spending way too much time typing in hashtags.
Let's help them with our own Hashtag Generator!

Here's the deal:

It must start with a hashtag (#).
All words must have their first letter capitalized.
If the final result is longer than 140 chars it must return false.
If the input or the result is an empty string it must return false.

Rules:
Explicit
  - Input: a String
  - Output: a String of false
  - if output string is > 140 characters return false
  - if input is empty return false
  - all words must have the first letter capitalized
  - remove all whitespace
  - capitalize each word
  - add a hash tag at the beginning

**Examples / Test Cases**

" Hello there thanks for trying my Kata"  =>  "#HelloThereThanksForTryingMyKata"
"    Hello     World   "                  =>  "#HelloWorld"
""                                        =>  false

**Data Structures**
- input String called sentence
- output String called hashtag
- create an Array called words

**Algorithm**
1. initialise an Array called words  
1a. return false if input_string == ''
2. set words equal to each word sepeated by whitespace from the sentence
3. iterate over words
  - capitalize the first letter of the word
4. join words without any whitespace
5. add a hashtag at the beginning
6. if new string is 140 characters or less return string otherwise return false

=end

def generateHashtag(sentence)
  p words = sentence.split(' ')
  
  words.map! do |word|
    word.capitalize    
  end
  
  
  hashtag = words.join
    
  return false if hashtag == '' || hashtag.length > 139
  
  p '#' + hashtag
  
  
end




p generateHashtag("") ==  false # "Expected an empty string to return false")
p generateHashtag(" " * 200) ==  false # "Still an empty string")
p generateHashtag("Do We have A Hashtag") == "#DoWeHaveAHashtag" #, "Expected a Hashtag (#) at the beginning.")
p generateHashtag("Codewars") == "#Codewars" # "Should handle a single word.")
p generateHashtag("Codewars Is Nice") == "#CodewarsIsNice" # "Should remove spaces.")
p generateHashtag("Codewars is nice") == "#CodewarsIsNice" # "Should capitalize first letters of words.")
p generateHashtag("code" + " " * 140 + "wars") == "#CodeWars"
p generateHashtag("Looooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooong Cat") == false  # "Should return false if the final word is longer than 140 chars.")

p generateHashtag("a" * 139) == "#A" + "a" * 138 # "Should work")
p generateHashtag("a" * 140) == false # "Too long")