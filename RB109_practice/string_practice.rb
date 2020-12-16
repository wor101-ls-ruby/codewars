string1 = "This is a super stupid test string"
string2 = "There once was a 937 year old dragon named Baldur"

p string1.sub(/[aeiou]/, '*')
p string1.gsub(/[aeiou]/, '*')
p string1.match?(/[aeiou]/)
p string2.match?('Baldur')
p string2.gsub('937', '1442')