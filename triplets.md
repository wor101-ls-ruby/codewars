**Problem**
There is a secret string which is unknown to you. Given a collection of random triplets from the string, recover the original string.

A triplet here is defined as a sequence of three letters such that each letter occurs somewhere before the next in the given string. "whi" is a triplet for the string "whatisup".

As a simplification, you may assume that no letter occurs more than once in the secret string.

You can assume nothing about the triplets given to you other than that they are valid triplets and that they contain sufficient information to deduce the original string.
In particular, this means that the secret string will never contain letters that do not occur in one of the triplets given to you.

Rules:
Explicit
  - Input: Nested array of arrays of 3 string chars
  - Output: string
  - each char in the array comes before the chars with greater indexes
  - all letters in triplets are included in the word
  - no letter occurs more than once in the string

**Examples / Test Cases**
secret_1 = "whatisup"
triplets_1 = [
  ['t','u','p'],
  ['w','h','i'],
  ['t','s','u'],
  ['a','t','s'],
  ['h','a','p'],
  ['t','i','s'],
  ['w','h','s']
]

recover_secret(triplets_1) ==  secret_1

**Data Structures**
- Input array
- output string


**Algorithm**
1. determine lenght of secret string by finding the total number of unique letters  from the input array and turn into its own array
2. create a return array with a lenght equal to that of the secret string
3. iterate over the array of unique characters
4. Create letter_count and start at 0
4. for each character iterate over each nested array from the input
  - create array of letters_with_index_greater than current char
  - create array of letters_with_index_less than
  - 