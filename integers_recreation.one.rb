def determine_divisors(int)
  current_divisor = 1
  divisors = []
  
  int.times do
    if int % current_divisor == 0
      divisors << current_divisor
      second_divisor = (int / current_divisor)
      if current_divisor != second_divisor
        divisors << (int / current_divisor)
      end
    end
    current_divisor += 1
    break if divisors.any? { |i| divisors.count(i) > 1 }
  end


  # current_divisor = int
  # divisors = []
  
  # int.times do 
  #   divisors << current_divisor if int % current_divisor == 0
  #   current_divisor -= 1
  # end
  divisors.uniq
end

def perfect_square?(number)
  number % 1 == 0 ? true : false
end

def sum_of_divisors_squared(divisors)
  divisors.map { |divisor| divisor**2 }.sum
end

def create_perfect_squares(int1, int2)
  perfect_squares = []
  (int1..int2).each { |i| perfect_squares << i**2 }
  perfect_squares
end

# **Algorithm - Divisors**
# 1. Create current_divsor variable and set equal to input integer
# 2. Create array to hold divsors
# 3. use #times method on current_divsor
#   - check if the input integer divided by current_divsor has a remainder
#   - if no remainder then add current_divsor to array of divisors

#   - current_divsor -= 1
# 4. return array of divsors

def list_squared(int1, int2)
  array_of_squares = []

  (int1..int2).each do |i|
     divisors = determine_divisors(i)
     sum = sum_of_divisors_squared(divisors)

    square_root = Math.sqrt(sum)
    perfect_square = perfect_square?(square_root)
    array_of_squares << [i, sum] if perfect_square
    
  end

  array_of_squares
end










# **Algorithm**
# 1. Create a range starting at first input integer and going to second input integer
# 2. for each integer in the range 
#   - find all divisors of that integer
#   - square the divsors and then add all totals together
#   - if the sum of squares of divisors is a square add it and the sum to the return array
# 3. return final array

# p list_squared(1, 10)

p list_squared(1, 250) == [[1, 1], [42, 2500], [246, 84100]]
p list_squared(42, 250) == [[42, 2500], [246, 84100]]
p list_squared(1, 250) == [[1, 1], [42, 2500], [246, 84100]]
p list_squared(42, 250) == [[42, 2500], [246, 84100]]
p list_squared(250, 500) == [[287, 84100]]
