require 'prime'
require 'pry'

def find_factors(n)
  factors = []

  (2...n).each do |int|
    if n % int == 0
      factors << int
    end
  end    
  factors

end

def proper_fractions(n)
  factors_of_n = find_factors(n)
  proper_numerators = []

  (1...n).each do |int|
    factors_of_int = find_factors(int)
    p factors_of_both = factors_of_n + factors_of_int
    if factors_of_both.none? { |factor| factors_of_both.count(factor) > 1 }
      proper_numerators << int
    end
  end

  prime_to_n = []
  Prime.each(n) { |num| prime_to_n << num}


  p proper_numerators

  
end





# p proper_fractions(1) == 0
# p proper_fractions(2) == 1
# p proper_fractions(5) == 4
p proper_fractions(15) == 8
# p proper_fractions(25) == 20