=begin
**Problem**
Not to brag, but I recently became the nexus of the Codewars universe! My honor and my rank were the same number. I cried a little.

Complete the method that takes a hash/object/directory/association list of users, and find the nexus: the user whose rank is the closest is equal to his honor. Return the rank of this user. For each user, the key is the rank and the value is the honor.

If nobody has an exact rank/honor match, return the rank of the user who comes closest. If there are several users who come closest, return the one with the lowest rank (numeric value). The hash will not necessarily contain consecutive rank numbers; return the best match from the ranks provided.

Rules:
Explicit
  - Input: a Hash with integer keys and values
  - Output: an integer (the key in the hash)
  - rank is the key in the hash
  - honor is the value
  - return rank that is closest or equal to honor (difference is the least)
  - if multiple matches the return the one with the lowest rank
**Examples / Test Cases**
        rank    honor
users = {  1  =>  93,
          10  =>  55,
          15  =>  30,
          20  =>  19,    <--- nexus
          23  =>  11,
          30  =>   2 }


**Data Structures**
- input hash
- output integer

**Algorithm**
1. initialize an Array called nexus_values
2. iterate through each pair in the hash
  - create a varaible called nexus_value
  - set nexus_value equal to the absolute value of the difference between rank and honor
  - push to nexus_values a two element array consisting of rank and nexus_value
3. sort nexus_values by the second element (nexus_value) of each sub-array
4. use the destructive #select! to only keep elements with the nexus_value of the first element in nexus_values
5. if only one element remains return the first element in the sub-array (rank)
6. otherise return the lowest rank in the array

=end

def nexus(users)
  nexus_values = []
  
  users.each_pair do |rank, honor|
    nexus_value = (rank - honor).abs
    nexus_values << [rank, nexus_value]    
  end
  
  nexus_values = nexus_values.sort_by { |nexus| nexus[1] } 
  best_nexus = nexus_values[0][1] 
  nexus_values.select! { |nexus| nexus[1] == best_nexus }
  
  return nexus_values[0][0] if nexus_values.size == 1
  
  nexus_values.min_by { |nexus| nexus[0] }[0]
 
end


users = {1 => 3, 3 => 3, 5 => 1}
p nexus(users) == 3

users = {1 => 10, 2 => 6, 3 => 4, 5 => 1}
p nexus(users) == 3

users = {1 => 10, 2 => 6, 3 => 4, 5 => 1, 6 => 5, 8 => 9}
p nexus(users) == 3