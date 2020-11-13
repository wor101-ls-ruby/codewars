**problem**
When we throw 2 classical dice (values on each side from 1 to 6) we have 36 (6 * 6) different results.

We want to know the probability of having the sum of the results equals to 11. For that result we have only the combination of 6 and 5. So we will have two events: {5, 6} and {6, 5}

So the probability for that result will be:

P(11, 2) = 2/(6*6) = 1/18    (The two is because we have 2 dice)

Now, we want to calculate the probability of having the sum equals to 8. The combinations for that result will be the following: {4,4}, {3,5}, {5,3}, {2,6}, {6,2} with a total of five combinations.

P(8, 2) = 5/36 

Things may be more complicated if we have more dices and sum values higher.

We want to know the probability of having the sum equals to 8 but having 3 dice.

Now the combinations and corresponding events are:

{2,3,3}, {3,2,3}, {3,3,2}
{2,2,4}, {2,4,2}, {4,2,2}
{1,3,4}, {1,4,3}, {3,1,4}, {4,1,3}, {3,4,1}, {4,3,1}
{1,2,5}, {1,5,2}, {2,1,5}, {5,1,2}, {2,5,1}, {5,2,1}
{1,1,6}, {1,6,1}, {6,1,1}

A total amount of 21 different combinations

So the probability is:
P(8, 3) = 21/(6*6*6) = 0.09722222222222222

Summarizing the cases we have seen with a function that receives the two arguments.

And think why we have this result:

rolldice_sum_prob(22, 3) == 0

(You do not have to round the results)

Rules:
  Explicit
    - Input: two integers
    - Output: floating point number
    - probability = (# of correct combinations) / (total # of combinations)
    - each dice has 6 sides
    - return probability of any one sum based off how many dice are rolled

**Examples / Test Cases**
rolldice_sum_prob(11, 2) == 0.0555555555 # or 1/18
rolldice_sum_prob(8, 2) ==  0.13888888889# or 5/36
rolldice_sum_prob(8, 3) == 0.0972222222222  # or 7/72

**Data Structures**
- input integers
- output floating point
- array of arrays for possible combinations [[1,4], [2,3]]

**Algorithm**
1. create Integer variable to hold total number of dice
2. create Integer variable to hold desired sum
3. create Integer variable to hold total number of possible outcomes (# dice * 6)
4. Determine combinations of dice rolls that result in desired sum and add to array
5. divide size of array by the total number of possible outcomes
6. return result

**Algorithm - desired_outcomes**
1. Create all possible outcomes
  - create array with dice # of elements
  - create recursive method 
    - each element (representing a die) starts at 1
    - the method increases one element by 1 up to 6
    - on each increase it checks if the arrays sum is equal to the desired sum
    - if so it adds the dice array to the desired_outcomes array
    -