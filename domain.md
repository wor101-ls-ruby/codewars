**Problem**
Write a function that when given a URL as a string, parses out just the domain name and returns it as a string. 
For example:

Rules:
Explicit
  - Input: string
  - Output: string
  - return string should contain only the domain name
Implicit
  - domain name does not include: 'http://', 'www.' or '.com'
  - domain name is alwasy before the '.com'


**Examples / Test Cases**
domain_name("http://github.com/carbonfive/raygun") == "github" 
domain_name("http://www.zombie-bites.com") == "zombie-bites"
domain_name("https://www.cnet.com") == "cnet"


**Data Structures**
- input string
- output string
- 

**Algorithm**
1. split string into an array by 'http://', 'www.' and '.com'
2. return the element at the index before element containing '.com'