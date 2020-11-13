**Problem**
Your job is to write a function which increments a string, to create a new string.

If the string already ends with a number, the number should be incremented by 1.
If the string does not end with a number. the number 1 should be appended to the new string.

Attention: If the number has leading zeros the amount of digits should be considered.

Rules:
Explicit
  - Input: string
  - Output: string
  - if string ends with a # then the # should be incremented by 1
  - if string does not end with a # then a 1 should be appended
  - leading zeros should be taken into account

**Examples / Test Cases**

increment_string("foo") == "foo1"
increment_string("foobar001") == "foobar002"
increment_string("foobar1") == "foobar2"
increment_string("foobar00") == "foobar01")
increment_string("foobar99" == "foobar100")
increment_string("") == "1")

**Data Structures**
- Input string
- Output string
- Array of characters
- 

**Algorthim**
1. turn string into an array of characters
2. select all characters that contain numbers
3. if no characters contain numbers 
  -  add 1 to end of the array
  -  rejoin the array into an integer and return
4. rejoin characters containing numbers into an integer
5. increase integer by 1
6. replace original characters at end of string with new integer characters