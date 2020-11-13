require 'pry'

def dice_roll(sum, dice, rolls = Array.new(dice, 1))
  desired_rolls = rolls

  dice.times do |count|
    (1..6).each do |roll|
      other_rolls = [0]
      if dice > 1
        other_rolls =  dice_roll((sum - roll), (dice - 1)).flatten
      end
      current_sum = roll + other_rolls.sum
      if current_sum == sum
        good_rolls = []
        good_rolls[0] = roll
        other_rolls.each_with_index { |r, i| good_rolls[i + 1] = r }
        desired_rolls << good_rolls
        break
      end
    end
    
    
  end
  
  desired_rolls
end


# def dice_roll(sum, dice, rolls = Array.new(dice, 1))
#   desired_rolls = []

#   if dice != 0 
#     (1..6).each do |current_roll|

#     ## currently flattening the array so after more than 2 dice it becomes a single array
#     # need to make sure rolls stay in groups of three
      
#       (dice).times do 
#         # binding.pry
#         break if sum == 0
#         other_rolls = dice_roll((sum - current_roll), (dice - 1)).flatten
#         current_sum = current_roll + other_rolls.sum
        
#         if current_sum == sum
#           desired_rolls << [current_roll] + other_rolls 
#           break
#         end
#       end
#     end
#   end
#   desired_rolls
# end

# **Algorithm - desired_outcomes**
# 1. Create all possible outcomes
#   - create array with dice # of elements
#   - create recursive method 
#     - each element (representing a die) starts at 1
#     - the method increases one element by 1 up to 6
#     - on each increase it checks if the arrays sum is equal to the desired sum
#     - if so it adds the dice array to the desired_outcomes array
    

def rolldice_sum_prob(sum, dice)
  total_possible_outcomes = dice * 6
  desired_outcomes = []
  
  dice_roll(sum, dice)
  
end



# **Algorithm**
# 1. create Integer variable to hold total number of dice
# 2. create Integer variable to hold desired sum
# 3. create Integer variable to hold total number of possible outcomes (# dice * 6)
# 4. Determine combinations of dice rolls that result in desired sum and add to array
# 5. divide size of array by the total number of possible outcomes
# 6. return result

p rolldice_sum_prob(7, 2)
p rolldice_sum_prob(6, 3)

# p rolldice_sum_prob(11, 2) == 0.0555555555 # or 1/18
# p rolldice_sum_prob(8, 2) ==  0.13888888889# or 5/36
# p rolldice_sum_prob(8, 3) == 0.0972222222222  # or 7/72