=begin
**Problem**
Complete the solution so that it returns the number of times the search_text is found within the full_text.




Rules:
Explicit
  - Input: two Strings
  - Output: Integer
  - first parameter is the text to be searched
  - second parameter is the string to find a match for
  - return an integer representing the number of timest the string appears 
Implicit
  - can this be passed an empty string?
  - is there always a match?

**Examples / Test Cases**
solution('aa_bb_cc_dd_bb_e', 'bb') # should return 2 since bb shows up twice
solution('aaabbbcccc', 'bbb') # should return 1

**Data Structures**
- input strings
- output integer
- current index

**Algorithm**
1. iterate over the string to be searched
2. use the length of the string to be matched to check that many characters in the string
3. any time there is a match update the output integer
  - this could cause issues with '3 identical letters matching 2 letters twice'
  - need move the index up after the next match

=end

def solution(main_string, search_string)
  start_index = 0
  stop_index = search_string.length - 1
  number_of_matches = 0
  

  while stop_index < main_string.length
    if search_string == main_string[start_index..stop_index]
      number_of_matches += 1
      start_index += search_string.length 
      stop_index += search_string.length
    elsif stop_index < main_string.length
      start_index += 1
      stop_index += 1
    end
  end
  number_of_matches
end

def solution(main_string, search_string)
  main_string.scan(search_string).count
end

p solution('aa', 'aa') == 1
p solution('aa_bb_cc_dd_bb_e', 'bb') == 2 # should return 2 since bb shows up twice
p solution('aaabbbcccc', 'bbb') == 1 # should return 1
p solution('abcdeb','b') ==  2
p solution('abcdeb', 'a') ==  1
p solution('abbc', 'bb') ==  1