=begin
**Problem**
The prime numbers are not regularly spaced. For example from 2 to 3 the step is 1. From 3 to 5 the step is 2. From 7 to 11 it is 4. Between 2 and 50 we have the following pairs of 2-steps primes:

3, 5 - 5, 7, - 11, 13, - 17, 19, - 29, 31, - 41, 43

We will write a function step with parameters:

g (integer >= 2) which indicates the step we are looking for,

m (integer >= 2) which gives the start of the search (m inclusive),

n (integer >= m) which gives the end of the search (n inclusive)

In the example above step(2, 2, 50) will return [3, 5] which is the first pair between 2 and 50 with a 2-steps.

So this function should return the first pair of the two prime numbers spaced with a step of g between the limits m, n if these g-steps prime numbers exist otherwise nil or null or None or Nothing or [] or "0, 0" or {0, 0} or 0 0(depending on the language).

Examples:
step(2, 5, 7) --> [5, 7] or (5, 7) or {5, 7} or "5 7"

step(2, 5, 5) --> nil or ... or [] in Ocaml or {0, 0} in C++

step(4, 130, 200) --> [163, 167] or (163, 167) or {163, 167}

See more examples for your language in "TESTS"

Remarks:
([193, 197] is also such a 4-steps primes between 130 and 200 but it's not the first pair).

step(6, 100, 110) --> [101, 107] though there is a prime between 101 and 107 which is 103; the pair 101-103 is a 2-step.

Rules:
Explicit
  - Input: 3 integers
  - Output: an array of two integers or nil
  - the step between primes is the the value of subtracting the lesser prime from the greater
  - the first input integer 'g' is the step we are looking for
  - the second input integer 'm' is the beginning of the range of primes
  - the third input integer 'n' is the end of the range of primes
  - we want to find and return the FIRST pair of primes within the range that has a step equal to 'g'

**Examples / Test Cases**
p step(2,100,110) == [101, 103]
p step(4,100,110) == [103, 107]
p step(6,100,110) == [101, 107]
p step(8,300,400) == [359, 367]
p step(10,300,400) == [307, 317]

**Data Structures**
- input Integers
- output array of two integers
- array of prime numbers

**Algorithm**
1. Initialize a variable to hold the array of prime numbers
2. create a list of primes between the second input integer and third input integer and add them to the array
3. iterate over the array
4. check the to see if the value of the current element subtracted from the next element is equal to the first input integer
5. if it is return those two elements in an array


=end
require 'prime'

def step(step, start, stop)
  prime_numbers = []
  return_primes = nil
  
  Prime.each(stop) { |prime| prime_numbers << prime if prime >= start }

  prime_numbers.each_with_index do |prime, index|
    counter = 1
    break if return_primes != nil
    
    until counter + index > prime_numbers.size
      if prime_numbers[index + counter] == nil 
        break
      elsif prime_numbers[index + counter] - prime == step
        return_primes = [prime, prime_numbers[index + counter]]
        break
      else
        counter += 1
      end    
    end
  end
  p return_primes
end


p step(2,100,110) == [101, 103]
p step(4,100,110) == [103, 107]
p step(6,100,110) == [101, 107]
p step(8,300,400) == [359, 367]
p step(10,300,400) == [307, 317]