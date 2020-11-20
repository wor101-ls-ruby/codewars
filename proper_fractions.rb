=begin
**Problem**
If n is the numerator and d the denominator of a fraction, that fraction is defined a (reduced) proper fraction if and only if GCD(n,d)==1.

For example 5/16 is a proper fraction, while 6/16 is not, as both 6 and 16 are divisible by 2, thus the fraction can be reduced to 3/8.

Now, if you consider a given number d, how many proper fractions can be built using d as a denominator?

For example, let's assume that d is 15: you can build a total of 8 different proper fractions between 0 and 1 with it: 1/15, 2/15, 4/15, 7/15, 8/15, 11/15, 13/15 and 14/15.

You are to build a function that computes how many proper fractions you can build with a given denominator:


Rules:
Explicit
  - Input: Integer
  - Output: Integer
  - proper fraction share only 1 as a common denominator between numerator and denominator
  - determine total number of possible proper fractions for the given denominator

**Examples / Test Cases**
proper_fractions(1) == 0
proper_fractions(2) == 1
proper_fractions(5) == 4
proper_fractions(15) == 8
proper_fractions(25) == 20

**Data Structures**

**Algorithm**
1. create array variable to hold proper numberators 
2. Find all factors for the denominator
3. Iterate through each possible numerator
  - if numerator is prime add it to list of proper_numerators
  - else find all factors for the numerator
  - if numerators factors are all uniq from the denominators add it t proper_numerators
4. return count of proper numerators
=end


require 'prime'
require 'pry'

def find_factors_with_prime(n)
  primes_up_to_n = []
  Prime.each(n) { |int| primes_up_to_n << int }
  p primes_up_to_n
    
end

def find_factors(n)
  factors = []

  (1..n).each do |int|
    if n % int == 0
      factors << int
    end
  end    
  factors

end

def proper_fractions(n)
  factors_of_n = find_factors(n)
  proper_numerators = []
  return 0 if n == 1

  (2...n).each do |num|
    factors_of_num = find_factors(num)

    if factors_of_num.select { |int| int != 1 }.none? { |int| factors_of_n.include?(int) }
      proper_numerators << num
    end
  end

  proper_numerators.count + 1
end


find_factors_with_prime(1000)


# p proper_fractions(1) == 0
# p proper_fractions(2) == 1
# p proper_fractions(5) == 4
# p proper_fractions(15) == 8
# p proper_fractions(25) == 20
# p proper_fractions(24)