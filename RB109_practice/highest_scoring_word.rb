=begin
**Problem**
Given a string of words, you need to find the highest scoring word.

Each letter of a word scores points according to its position in the alphabet: a = 1, b = 2, c = 3 etc.

You need to return the highest scoring word as a string.

If two words score the same, return the word that appears earliest in the original string.

All letters will be lowercase and all inputs will be valid.

Rules:
Explicit
  - Input: a String of words
  - Output: a String of one word
  - each letter is worth a point equal to its position in the alphabet
  - all letters will be lowercase
  - return word with highest total score
  - if multiple words tied, return the first

**Examples / Test Cases**
high('man i need a taxi up to ubud') ==  'taxi'
high('what time are we climbing up the volcano') == ''volcano'
high('take me to semynak') ==  'semynak'
high('aaa b') ==  'aaa'

**Data Structures**
- input String
- output String
- hash of values { 'a' => 1,'b'=> 2, etc}

**Algorithm**
1. creat hash of alphabet using letter as key and points as value
1a. Initialize a high_score_word variable and set to nil
1b. Initialized a current_high_score and set to 0
2. create array of words by splitting input string at whitespace
3. Iterate over the array
4. for each word use the alphabet hash to total the words score
5. if the words score is higher than the current high_score then set high_word_score to current word
6. return high_score_word
=end

def set_values
  alphabet = {}
  value = 1
  
  ('a'..'z').each do |letter|
    alphabet[letter] = value
    value +=1
  end
  alphabet
end

def high(sentence)
  alphabet = set_values
  winning_word = nil
  high_score = 0
  
  sentence.split.each do |word|
    word_value = 0
    word.chars.each { |char| word_value += alphabet[char] }
    if word_value > high_score
      winning_word = word
      high_score = word_value
    end    
  end
  
  p winning_word
end



p high('man i need a taxi up to ubud') ==  'taxi'
p high('what time are we climbing up the volcano') == 'volcano'
p high('take me to semynak') ==  'semynak'
p high('aaa b') ==  'aaa'