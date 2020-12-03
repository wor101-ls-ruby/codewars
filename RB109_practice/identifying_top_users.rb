=begin
**Problem**
A website named "All for Five", sells many products to registered clients that cost all the same (5 dollars, the price is not relevant). Every user receives an alphanumeric id code, like D085. The page tracks all the purchases, that the clients do. For each purchase of a certain client, his/her id user will be registered once.

You will be given an uncertain number of arrays that contains strings (the id code users). Each array will represent the purchases that the users do in a month. You should find the total number of purchases of the users that have bought in all the given months (the clients that their id code are present in all the arrays). e.g.:

Rules:
Explicit
  - Input: a unknown number of Arrays
  - Output: an Array of Arrays
  - each input array consists of user ID's
  - only return users whose ID is included in every input array
  - return the user along with the total number of times the user ID appears
  - if multiple users with same number of purchases order by user ID

**Examples / Test Cases**
  a1 = ['A042', 'B004', 'A025', 'A042', 'C025']
  a2 = ['B009', 'B040', 'B004', 'A042', 'A025', 'A042']
  a3 = ['A042', 'A025', 'B004']
  The result will be:

  'A042'---> 5 times
  'A025'---> 3 times
  'B004'---> 3 times
  It may be that not even a single user has purchased in all the months

  a1 = ['A043', 'B004', 'A025', 'A042', 'C025']
  a2 = ['B009', 'B040', 'B003', 'A042', 'A027', 'A044']
  a3 = ['A041', 'A026', 'B005']
  Even though '0042' is present in two arrays, is not present in all the arrays.

  The function that solves this challenge will be called as: id_best_users().

  The entries of the function and the output for the cases above will be:

  a1 = ['A042', 'B004', 'A025', 'A042', 'C025']
  a2 = ['B009', 'B040', 'B004', 'A042', 'A025', 'A042']
  a3 = ['A042', 'A025', 'B004']
  id_best_users(a1, a2, a3) == [[5, ['A042']], [3, ['A025', 'B004']]]

  a1 = ['A043', 'B004', 'A025', 'A042', 'C025']
  a2 = ['B009', 'B040', 'B003', 'A042', 'A027', 'A044']
  a3 = ['A041', 'A026', 'B005']
  id_best_users(a1, a2, a3) == []

**Data Structures**
- input arrays consisitng of string elements
- output arrays where each element is an array consisting of an integer and another consisting of strings
  [[5, ['A042']], [3, ['A025', 'B004']]]

**Algorithm**
1. Initialize a variable to hold the arguments
2. Intialize a variable to hold the return array
3. Initialize a variable to hold each unique user ID in a string
4. Iterate through each unique user Id
  - check to see if it is included in each input array
    - every_month_purcharser and set to true
    - iterate trough monthly_purchases 
    - for each element/month check to see if 'id' is included
    - if it is not included set every_month_purcharser to false and go to next user id
    - after iterating through every month, if every_month_purcharser add it to best_purchasers
    - 
  - if it is then total up the number of times it appears
  - add it to the return array
5. Format the return array to combine user id#s with the same number of purchases

1. Intializie a new Array to be returned
2. Iterate over the purcharsers array
3. Take the first elements from each array in purcharsers
4. Of those elements eliminate duplicats 
5. Add to return array in order from largest to smallest as an element in an Array

1. iterate thhrough the unique number of purchases
2. for each one check every element in purchases for its first element (the number purchases)
3. if it matches add the userid (second element) to the current purchase number



=end

def get_unique_ids(monthly_purchases)
   unique_ids = monthly_purchases.flatten.uniq
end

def get_best_purchasers(unique_user_ids, monthly_purchases)
  best_purchasers = []
  
  unique_user_ids.each do |id|
    every_month_purchaser = true

    monthly_purchases.each do |month|
      month.include?(id) ? next : every_month_purchaser = false
    end

   if every_month_purchaser == true
     number_of_purchases = monthly_purchases.flatten.count(id)
     best_purchasers << [number_of_purchases, id]
   end
  end
  
  best_purchasers  
end


def format_best_purchasers(purchasers)
  formatted_array = []
  
  unique_number_of_purchases = purchasers.map { |customer| customer[0] }.uniq.sort { |a, b| b <=> a }
  unique_number_of_purchases.each { |purchase_number| formatted_array << purchase_number }

  formatted_array.map! do |number_purchases|
    user_ids = []
    purchasers.each do |purchase|
      user_ids << purchase[1] if purchase[0] == number_purchases
    end
    [number_purchases, user_ids.sort]
  end
 
  formatted_array  
end




def id_best_users(*args)
  monthly_purchases = args  
  unique_user_ids = get_unique_ids(monthly_purchases)
  best_purchasers = get_best_purchasers(unique_user_ids, monthly_purchases)
  format_best_purchasers(best_purchasers)
end


a1 = ['A042', 'B004', 'A025', 'A042', 'C025']
a2 = ['B009', 'B040', 'B004', 'A042', 'A025', 'A042']
a3 = ['A042', 'A025', 'B004']
p id_best_users(a1, a2, a3) == [[5, ['A042']], [3, ['A025', 'B004']]]

a1 = ['A043', 'B004', 'A025', 'A042', 'C025']
a2 = ['B009', 'B040', 'B003', 'A042', 'A027', 'A044']
a3 = ['A041', 'A026', 'B005']
p id_best_users(a1, a2, a3) ==  []

a1 = ['A042', 'B004', 'A025', 'A042', 'C025']
a2 = ['B009', 'B040', 'B004', 'A042', 'A025', 'A042']
a3 = ['A042', 'B004', 'A025', 'A042', 'C025', 'B009', 'B040', 'B004', 'A042', 'A025', 'A042']
a4 = ['A042', 'A025', 'B004']
p id_best_users(a1, a2, a3, a4) == [[9, ['A042']], [5, ['A025', 'B004']]]