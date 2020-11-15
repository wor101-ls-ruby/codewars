def dice_rolls(sum, dice)
  final_rolls = []

  (1..6).each do |current_roll|
    if dice == 1 && current_roll == sum
      final_rolls = [[current_roll]]
    elsif (sum - current_roll) != 0 && dice != 1
      remaining_dice = dice_rolls((sum - current_roll), (dice - 1))
      remaining_dice.each { |rolls| final_rolls << rolls.unshift(current_roll) }
    end
  end
  final_rolls
end

def rolldice_sum_prob(sum, dice)
  total_possible_outcomes = 6**dice
  desired_outcomes = dice_rolls(sum, dice)
  desired_outcomes.size / total_possible_outcomes.to_f
end



# **Algorithm**
# 1. create Integer variable to hold total number of dice
# 2. create Integer variable to hold desired sum
# 3. create Integer variable to hold total number of possible outcomes (# dice * 6)
# 4. Determine combinations of dice rolls that result in desired sum and add to array
# 5. divide size of array by the total number of possible outcomes
# 6. return result

# p rolldice_sum_prob(7, 2)
# p rolldice_sum_prob(6, 3)

p rolldice_sum_prob(11, 2) == 0.05555555555555555 # or 1/18
p rolldice_sum_prob(8, 2) ==  0.1388888888888889 # or 5/36
p rolldice_sum_prob(8, 3) == 0.09722222222222222  # or 7/72