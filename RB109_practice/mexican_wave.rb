=begin
**Problem**
The wave (known as the Mexican wave in the English-speaking world outside North America) is an example of metachronal rhythm achieved in a packed stadium when successive groups of spectators briefly stand, yell, and raise their arms. Immediately upon stretching to full height, the spectator returns to the usual seated position.

The result is a wave of standing spectators that travels through the crowd, even though individual spectators never move away from their seats. In many large arenas the crowd is seated in a contiguous circuit all the way around the sport field, and so the wave is able to travel continuously around the arena; in discontiguous seating arrangements, the wave can instead reflect back and forth through the crowd. When the gap in seating is narrow, the wave can sometimes pass through it. Usually only one wave crest will be present at any given time in an arena, although simultaneous, counter-rotating waves have been produced. (Source Wikipedia)

Task:
In this simple Kata your task is to create a function that turns a string into a Mexican Wave. You will be passed a string and you must return that string in an array where an uppercase letter is a person standing up. 

Rules:
 1.  The input string will always be lower case but maybe empty.

 2.  If the character in the string is whitespace then pass over it as if it was an empty seat

Rules:
Explicit
  - Input: a String 
  - Output: an Array of Strings
  - the input string will be lowercase
  - the input could be empty
  - the input can contain whitespace
  - create an array of words where one each consecutive leter is capitalized in turn
  - white space should be skipped and does not count as a consecutive character
  - the output Array is going to consist of a number of elements equal to the number of letters in the input string

**Examples / Test Cases**
wave("hello") => ["Hello", "hEllo", "heLlo", "helLo", "hellO"]

**Data Structures**
- input String (input_string)
- output Array (the_wave)
- 


**Algorithm**
1. initiazlize an Array variable named the_wave 
2. create a range from 0 up to but not inluding the size of the input strin
3. use the each method to iterate over the range
  - use the current number from the range to represent the index position in the input string
  - if the current character is not whitespace upcase the character and add the string to the_wave
    - turn input string into an array called characters
    - use the index position to upcase the currect character in the array
    - join the array into a string called standing
    - push standing to the_wave
  - if the current character is whitespace, go to the next character
4. return the_wave


=end

def wave(input_string)
  the_wave = []
  
  (0...input_string.size).each do |index|
    if input_string[index] != ' '
      characters = input_string.chars
      characters[index] = characters[index].upcase
      the_wave << characters.join
    else
      next
    end
  end
  the_wave
end


result = ["Hello", "hEllo", "heLlo", "helLo", "hellO"]
p wave("hello") == result

result = ["Codewars", "cOdewars", "coDewars", "codEwars", "codeWars", "codewArs", "codewaRs", "codewarS"]
p wave("codewars") == result

result = []
p wave("") == result

result = ["Two words", "tWo words", "twO words", "two Words", "two wOrds", "two woRds", "two worDs", "two wordS"]
p wave("two words") == result

result = [" Gap ", " gAp ", " gaP "]
p wave(" gap ") == result