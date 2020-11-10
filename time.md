**Problem**
 write a function which formats a duration, given as a number of seconds, in a human-friendly way.

The function must accept a non-negative integer. If it is zero, it just returns "now". 
Otherwise, the duration is expressed as a combination of years, days, hours, minutes and seconds.

It is much easier to understand with an example:

Rules:
Explicit
  - Input: Integer
  - Output: string
  - string mad of components 
  - if unit is pluraly than use plural language
  - if more than two units, separate by commas
  - if two units separate by and
  - if unit equals 0 it will not be included in the string
  - 

**Examples / Test Cases**
format_duration(62)    # returns "1 minute and 2 seconds"
format_duration(3662)  # returns "1 hour, 1 minute and 2 seconds"
format_duration(1) == "1 second"
format_duration(62) == "1 minute and 2 seconds"
format_duration(120) == "2 minutes"
format_duration(3600) == "1 hour")
format_duration(3662) ==  "1 hour, 1 minute and 2 seconds")

**Data Structures**
- Input integer (non-negative) - represents total number of seconds
- Output string
- years - integer
- days - 
- hours - 
- minutes 
- seconds

**Algorithm**
1. Determine total number of years and subtract seconds used from total number of remaining seconds
2. Determine total number of days and subtract seconds used from total number of remaining seconds
3. Determine total number of hours and subtract seconds used from total number of remaining seconds
4. Determine total numbers of minutes and subtract seconds used from total number of remaining seconds
5. Set seconds to equal the total number of remaining seconds
6. Format string
7. return string
8. 

**Problem**
Format the string output properly

**Algorithm**
1. create a hash of [years: 0, days: 0, hours: 0, minutes: 0, seconds: 0 ]
2. if years equals 1 the set hash[years] to equal '1 year'
3. if years is greater than 1 then set hash[years] to equa 'x years'
4. repeat steps 2-3 for days, hours minutes, seconds
3. turn the values of the hash into an array 
4. from the array of values select all that are not 0
5. if the arrays size == 1 then return the arry
6. if the arrays size == 2 then join the two elemeents with ' and ' and return the array
7. if the arrays size > 2
  - join the last two elements with ' and ' 
  - join the other elements with ', '
  - combine both and return