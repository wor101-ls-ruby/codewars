=begin
**Problem**

This kata is inspired on the problem #50 of the Project Euler.

The prime 41 is the result of the sum of many consecutive primes.

In fact, 2 + 3 + 5 + 7 + 11 + 13 = 41 , (6 addens)

Furthermore, the prime 41 is the prime below 100 (val_max) that has the longest chain of consecutive prime addens.

The prime with longest chain of addens for val_max = 500 is 499 with 17 addens.

In fact: 3+5+7+11+13+17+19+23+29+31+37+41+43+47+53+59+61= 499

Find the function prime_maxlength_chain()(primeMaxlengthChain() javascript), that receives an argument val_max, the upper limit, all the found primes should be less than val_max and outputs this found prime.

100 ≤ val_max ≤ 500.000



Rules:
Explicit
  - Input: an Integer between 100 and 500
  - Output: an Array of 1 or more Integer elements
  - find the prime below the input integer that can be created by summing the longest list of other primes
  - if more than one prime meets this critera, return both in a sorted array
  
**Examples / Test Cases**
prime_maxlength_chain(100) == [41]
prime_maxlength_chain(500) == [499]
If we have more than one prime with these features, the function should output an array with the found primes sorted.

prime_maxlength_chain(499) == [379, 491]
Random Tests for val_max (valMax)


**Data Structures**
- input integer (max_value)
- return Array called max_length_primes
- an Array called primes 
- an Array called prime_chains


**Algorithm**
1. initialize an Array variable called primes
  - use the Primes (require 'prime') to add primes to the array up o the max_value
2. initialzie an Array called max_length_primes which will be our return array
3. initialzie an Array called prime_chains to hold the prime integers that sum to another prime
4. iterate over the primes array using current_prime to represent the current element
  - create a count variable and set to 1
  - loop and on each loop (continue this loop until count + index > size of primes)
    - for each current_prime, sum it with the array from index + 1 to count
      - if so add it and the next element as an array to the prime_chains
    - continue this by adding to the next two elements, the next three elements, etc
5. find the array element/s within prime_chains that is the longest and 
6. sum each of those elements and add the value to the max_length_primes array
7. sort max_length_primes and return it

=end

require 'prime'

def prime_maxlength_chain(max_value)
  primes = []
  Prime.each(max_value - 1) { |prime| primes << prime }
  max_length_primes = []
  prime_chains = []
  
  (0...primes.length).each do |index|
    count = 1
    until (count + index) >= primes.size
      current_sum = primes[index..count].sum
      if primes.include?(current_sum)
        prime_chains << primes[index..count]
      end
      count += 1
    end
  end
  max_size = prime_chains.max_by { |chain| chain.size }.size if prime_chains != []

  prime_chains.select! { |chain| chain.size == max_size }
  prime_chains.each { |chain| max_length_primes << chain.sum }

  p max_length_primes.sort
  
end



p prime_maxlength_chain(5) == []
p prime_maxlength_chain(499) == [379, 491]

p prime_maxlength_chain(100) == [41]
p prime_maxlength_chain(200) == [197]
p prime_maxlength_chain(500) == [499]
p prime_maxlength_chain(1000) == [953]