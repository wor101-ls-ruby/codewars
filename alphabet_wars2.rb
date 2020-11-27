=begin
**Problem**
Write a function that accepts fight string consists of only small letters and return who wins the fight. 
When the left side wins return Left side wins!, 
when the right side wins return Right side wins!, 
in other case return Let's fight again!.

The left side letters and their power:
   w - 4
   p - 3 
   b - 2
   s - 1
   t - 0 (but it's priest with Wo lo loooooooo power)
   
  The right side letters and their power:
   m - 4
   q - 3 
   d - 2
   z - 1
   j - 0 (but it's priest with Wo lo loooooooo power)
   
The other letters don't have power and are only victims.

The priest units t and j change the adjacent letters from hostile letters to friendly letters with the same power.

mtq => wtp
wjs => mjz
A letter with adjacent letters j and t is not converted i.e.:

tmj => tmj
jzt => jzt
The priests (j and t) do not convert the other priests ( jt => jt).



Rules:
Explicit
  - Input:
  - Output:

**Examples / Test Cases**


**Data Structures**

**Algorithm**
1. turn input string into an array of characters
2. iterate over the array to create a new array with characters converted by priests
3. iterate over new array and tabulate scores for both sides
4. return a string announcing winner or draw

**Algortihm - convert**
1. create return array
2. iterate over input array with index
3. if index == 0 then check if char at index 1 is a priest
  - if priest then send then convert
  - else add to return arraynext
4. else  check to see if a priest is on the left side
  - if a priest is on the left side then send to conversion

**Priest Converson Algorithm**
1. pass the prior character (or nil), current character, and following character (or nil) to the method
2. if prior character is 'j' AND following character is NOT 't' then send to 'j' conversion
3. if prior character is 't' AND following character is NOT 'j' then send to 't' conversion
4. return converted character

**j-conversion Algorithm**
1. if char is a key in RIGHT_SIDE then return char
2. elsif char is a key in LEFT_SIDE then get the value
3. use value as key in VALUES hash to access the first element of the value
4. return the first element

=end
require 'pry'

VALUES = { 4 => ['m', 'w'], 3 => ['q', 'p'],
           2 => ['d', 'b'], 1 => ['z', 's'],
           0 => ['j', 't']
          }

LEFT_SIDE = { 'w' => 4, 'p' => 3,
               'b' => 2, 's' => 1,
               't' => 0 
             }

RIGHT_SIDE= { 'm' => 4, 'q' => 3,
              'd' => 2, 'z' => 1,
              'j' => 0 
            }

def is_priest?(char)
  char == 'j' || char == 't'
end

def t_conversion(char)
  if LEFT_SIDE.keys.include?(char)
    char
  elsif RIGHT_SIDE.keys.include?(char) && char != 'j'
      VALUES[RIGHT_SIDE[char]][1]
  else
    char
  end
end

def j_conversion(char)
  if RIGHT_SIDE.keys.include?(char)
    char
  elsif LEFT_SIDE.keys.include?(char) && char != 't'
      VALUES[LEFT_SIDE[char]][0]
  else
    char
  end
end


def priest_converts(previous, char, following)
  # binding.pry
  if (previous == 'j' && following != 't') || (following == 'j' && previous != 't')
    j_conversion(char)
  elsif (previous == 't' && following != 'j') || (following == 't' && previous != 'j')
    t_conversion(char)
  else
    char
  end
end

def convert(array)
  return_array = []
  
  array.each_with_index do |char, index|
    # binding.pry
    if index == 0 && is_priest?(array[1])
      return_array << priest_converts(nil, char, array[1])
    elsif index > 0 && is_priest?(array[index - 1]) || is_priest?(array[index + 1])
      return_array << priest_converts(array[index - 1], char, array[index + 1])
    elsif index == array.size - 1 && is_priest?(array[index - 1])
      return_array << priest_converts(array[index - 1], char, nil)
    else
      return_array << char
    end
  end
  return_array
end

def tabulate_score(array)
  score = [0,0]
  array.each do |char|
    if LEFT_SIDE.keys.include?(char)
      score[0] += LEFT_SIDE[char]
    elsif RIGHT_SIDE.keys.include?(char)
      score[1] += RIGHT_SIDE[char]
    end
  end
  score
  
end

def announce_winner(score)
  if score[0] > score[1]
    "Left side wins!"
  elsif score[0] < score[1]
    "Right side wins!"
  else
    "Let's fight again!"
  end
end

def alphabet_war(string)
  characters = string.chars
  converted_characters = convert(characters)
  score = tabulate_score(converted_characters)
  
  p announce_winner(score)
  
end





p alphabet_war('z') == "Right side wins!"
p alphabet_war('tz') == "Left side wins!"
p alphabet_war('jbdt') =="Let's fight again!"
p alphabet_war('jz') == "Right side wins!"
p alphabet_war('zt') == "Left side wins!"
p alphabet_war('sj') =="Right side wins!"
p alphabet_war('azt') == "Left side wins!"
p alphabet_war('tzj') == "Right side wins!"
p alphabet_war('wololooooo') == "Left side wins!"
p alphabet_war('zdqmwpbs') =="Let's fight again!"
p alphabet_war('ztztztzs') =="Left side wins!"