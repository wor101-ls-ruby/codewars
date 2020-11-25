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
  - Input: a String of letters
  - Output: One of three predetermined strings
  - whoever has the most points wins
  - tie says lets fight again
  - certain letters have certain points values
  - 'j' and 't' are special and convert other sides letters to their own
  - 'j' and 't' cannot convert each other
  - a letter with both 'j' and 't' adjacent is not converted

**Examples / Test Cases**
AlphabetWar("z")         //=>  "z"  => "Right side wins!"
AlphabetWar("tz")        //=>  "ts" => "Left side wins!" 
AlphabetWar("jz")        //=>  "jz" => "Right side wins!" 
AlphabetWar("zt")        //=>  "st" => "Left side wins!" 
AlphabetWar("azt")       //=> "ast" => "Left side wins!"
AlphabetWar("tzj")       //=> "tzj" => "Right side wins!" 

**Data Structures**
-input string
- hashes of letters and values
- Array of characters
- Array of three output strings

**Algorithm**
1. Create hashes for both right and left side
2. Create score for right side and left side
2. convert inptu string into an array of characters
3. Iterate over the array of characters with index
4. Check to see if the character is included in eiter sides
5. if not next
6. if so 

=end

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
  score = [0, 0]
  priests = ['j', 't']
  
  string.chars.each_with_index do |char, index|
    if priests.any? { |priest| string.chars[index - 1] == priest || string.chars[index + 1] == priest }
      if string.chars[index - 1] == 'j' && string.chars[index + 1] != 't'
        characters[index] =  VALUES.select { |key, value| value.include?(char) }.values[0][0]
      elsif string.chars[index - 1] == 't' && string.chars[index + 1] != 'j'
        characters[index] =  VALUES.select { |key, value| value.include?(char) }.values[0][1]
      elsif string.chars[index - 1] != 't' && string.chars[index + 1] == 'j'
        characters[index] =  VALUES.select { |key, value| value.include?(char) }.values[0][0]
      elsif string.chars[index - 1] != 'j' && string.chars[index + 1] == 't'
        characters[index] =  VALUES.select { |key, value| value.include?(char) }.values[0][1]
      end
    end
  end

  characters.each do |char|
    if LEFT_SIDE.keys.include?(char)
      score[0] += LEFT_SIDE[char]
    elsif RIGHT_SIDE.keys.include?(char)
      score[1] += RIGHT_SIDE[char]
    end
  end
  # if score[0] > score[1]
  #   p "Left side wins!"
  # elsif score[0] < score[1]
  #   p "Right side wins!"
  # else
  #   p "Let's fight again!"
  # end
  announce_winner(score)
end

# def priest_transformation(array)
#   if array[0] == 'j' && array[2] != 't'
#     RIGHT_SIDE.each_pair { |letter, value| if value == 
# end



# def update_score(char, score)
#   if RIGHT_SIDE[char] != nil
#   score[1] += RIGHT_SIDE[char]
#   elsif LEFT_SIDE[char] != nil
#   score[0] += LEFT_SIDE[char]
#   end
#   score
# end

# def alphabet_war(string)
#   score = [0, 0]
#   characters = string.chars
  
  
  
#   characters.each_with_index do |char, index|
#     if ['j', 't'].none? { |priest| characters[index - 1] == priest || characters[index + 1] == priest } 
#       score = update_score(char, score)
#       # if RIGHT_SIDE[char] != nil
#       #   score[1] += RIGHT_SIDE[char]
#       # elsif LEFT_SIDE[char] != nil
#       #   score[0] += LEFT_SIDE[char]
#       # end
#     elsif ['j', 't'].any?  { |priest| characters[index - 1] == priest || characters[index + 1] == priest }
#       if characters[index - 1] == 'j' && characters[index + 1] != 't'
        
        
#     end
    
#   end
# p score
# end


p alphabet_war('z') == "Right side wins!"
p alphabet_war('tz') == "Left side wins!"
p alphabet_war('jbdt') =="Let's fight again!"
# p alphabet_war('jz') == "Right side wins!"
# p alphabet_war('zt') == "Left side wins!"
# p alphabet_war('sj') =="Right side wins!"
# p alphabet_war('azt') == "Left side wins!"
# p alphabet_war('tzj') == "Right side wins!"
# p alphabet_war('wololooooo') == "Left side wins!"
# p alphabet_war('zdqmwpbs') =="Let's fight again!"
# p alphabet_war('ztztztzs') =="Left side wins!"