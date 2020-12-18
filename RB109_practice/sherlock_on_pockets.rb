=begin
**Problem**
Sherlock has to find suspects on his latest case. He will use your method, dear Watson. 
Suspect in this case is a person which has something not allowed in his/her pockets.

Allowed items are defined by array of numbers.

Pockets contents are defined by map entries where key is a person and value is one or few things represented by an array of numbers (can be nil or empty array if empty), example:


Write method which helps Sherlock to find suspects. If no suspect is found or there are no pockets (pockets == nil), the method should return nil.



Rules:
Explicit
  - Input: a Hash and an Arry of integers
  - Output: an Array of symbols or nil
  - return all symbols from the input hash that include integer values NOT included in the input Array
  - if all values are included in the input array return nil

**Examples / Test Cases**
pockets = { 
  bob: [1],
  tom: [2, 5],
  jane: [7]
} 

find_suspects(pockets, [1, 2]) # => [:tom, :jane]
find_suspects(pockets, [1, 7, 5, 2]) # => nil
find_suspects(pockets, []) # => [:bob, :tom, :jane]
find_suspects(pockets, [7]) # => [:bob, :tom]

**Data Structures**
- input Hash called pockets { suspect: [item1, item2], suspect2: [item1, item5], etc }
- input Array of integers called allowed
- outpt Array called suspects with symbols as elements [ :suspect1, :suspect4 ]


**Algorithm**
1. initialize an Array variable called suspects
2. iterate over the pockets with each key (suspect)  value (items) pair 
  - has_contraband and set to false 
  - iterate over items
    - if item included in allowed array go to next item
    - else set the has_contraband to false
  - if has contraband is false then add suspect to suspects array
3. return suspects array

=end
def xarray(value)
    value.nil? ? nil : Array(value).sort
end

def find_suspects(pockets, allowed)
  suspects = []
  
  pockets.each_pair do |suspect, items|
    has_contraband = false
    next if items == nil # || items == []
    items.each { |item| allowed.include?(item) ? next : has_contraband = true }

    has_contraband == false ? next : suspects << suspect
  end
  
  return nil if suspects == []
  p suspects
end


pockets = {}
p find_suspects(pockets, [1, 3]) == nil # 'should return nil for pockets: {} and allowed items [1, 3]')

  
pockets = { tom: [2], bob: [2], julia: [3], meg: [3] }
find_suspects(pockets, [2, 3]) ==  nil # "should return nil for pockets: #{pockets} and allowed items [2,3]")

pockets = { julia: nil, meg: [] } 
p find_suspects(pockets, [1, 6]) == nil # "should return nil for empty pockets: #{pockets} and allowed items [1,6]")

pockets = { meg: [3], tom: [5] }
suspects = [:meg, :tom].sort
p xarray(find_suspects(pockets, [])) == suspects # "should return #{suspects.inspect} for pockets: #{pockets} and allowed empty items []")

  
pockets = { meg: [1, 3], tom: [5, 3] }
p find_suspects(pockets, [1, 3]) ==  [:tom] # "should return [:tom] for pockets: #{pockets} and allowed items [1,3]")
    