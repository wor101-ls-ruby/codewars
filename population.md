=begin
**Problem**
In a small town the population is p0 = 1000 at the beginning of a year. 
The population regularly increases by 2 percent per year and moreover 50 new inhabitants per year come to live in the town. 
How many years does the town need to see its population greater or equal to p = 1200 inhabitants?

At the end of the first year there will be: 
1000 + 1000 * 0.02 + 50 => 1070 inhabitants

At the end of the 2nd year there will be: 
1070 + 1070 * 0.02 + 50 => 1141 inhabitants (number of inhabitants is an integer)

At the end of the 3rd year there will be:
1141 + 1141 * 0.02 + 50 => 1213

It will need 3 entire years.

More generally given parameters:

p0, percent, aug (inhabitants coming or leaving each year), p (population to surpass)

the function nb_year should return n number of entire years needed to get a population greater or equal to p.

aug is an integer, percent a positive or null number, p0 and p are positive integers (> 0)

Examples:


Rules:
Explicit
  - Input: 4 integers
  - Output: integer
  - first parameter defines the starting popultion
  - second paramter is the percentage of growth each year
  - third parameter is the number of people going to or leaving each year
  - fourth parameter is the target population

**Examples / Test Cases**
nb_year(1500, 5, 100, 5000) == 15
nb_year(1500000, 2.5, 10000, 2000000) == 10

**Data Structures**

**Algorithm**
1. Initialize variable to represent number of years and set it to 0
2. Initialize a variable to represent the current population and set it to equal the first parameter
3. define a method to calculate population change over 1 year
  - method must take the current population, percentage, growth, number of poeple coming/going
  - it should return the new population
4. set the current population to equal the new population returned from our method
5. increase the year by 1
6. if the current population is equal to or greater than the target population return years
7. otherwise repeat steps 4-6
=end