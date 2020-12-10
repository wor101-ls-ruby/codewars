=begin
1. create an array of all possible combinations
2. start with the number itself then iterate down 1 at a time
3. during each iteration add the new number and a second number whose sum equals the original #
    - if the second number is greater than 1 pass the second to the method to get all possible combinations
    - then append each of those combinations to the new number and add to array

=end

def get_combos(number)
  combinations = [number]
  
  return [] if number < 0
  return [number] if number == 0

  
  current_number = number - 1
  
  until current_number == 0 do
    second_number = number - current_number
    combinations << [second_number, current_number]
    
    if second_number > 1
      second_combos = get_combos(second_number).select { |combos| combos != second_number }
      second_combos = second_combos.each { |combo| combo.sort! }.uniq
      second_combos.each do |combo|
        combinations <<  [current_number] + combo
      end
    end
      
    current_number -= 1  
  end
  
  combinations.each { |combo| combo.sort! if combo.class == Array } 
  combinations.uniq
  
end

def create_hash
  hash = {}
  
  (0..9).each do |int|
   hash[int] = get_combos(int).count
  end
 hash 
  
end

def exp_sum(num)

  get_combos(num).count
end

# p exp_sum(10) == 42
# p exp_sum(0) == 1
# p exp_sum(1) == 1
# p exp_sum(-1) == 0
# p exp_sum(4) == 5
# p exp_sum(11)
# puts 
p create_hash
p get_combos(1)
p get_combos(2)
p get_combos(3)
p get_combos(4)
p get_combos(5)
# p exp_sum(1)
# p exp_sum(2)
# p exp_sum(3)
# p exp_sum(4)
# p exp_sum(5)
# p exp_sum(6)
# p exp_sum(7)
# p exp_sum(8)
# p exp_sum(9)
# p exp_sum(10)