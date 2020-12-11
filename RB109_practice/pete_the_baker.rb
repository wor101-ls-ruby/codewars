=begin
**Problem**
Pete likes to bake some cakes. He has some recipes and ingredients. Unfortunately he is not good in maths. Can you help him to find out, how many cakes he could bake considering his recipes?

Write a function cakes(), which takes the recipe (object) and the available ingredients (also an object) and returns the maximum number of cakes Pete can bake (integer). For simplicity there are no units for the amounts (e.g. 1 lb of flour or 200 g of sugar are simply 1 or 200). Ingredients that are not present in the objects, can be considered as 0.

Rules:
Explicit
  - Input: two Hashse with symbols as keys  and integers as values
  - Output: an Integer
  - determine the maximum # of te first object that can be created with values in the second
  - return the integer
  

**Examples / Test Cases**
// must return 2
cakes({flour: 500, sugar: 200, eggs: 1}, {flour: 1200, sugar: 1200, eggs: 5, milk: 200}); 
// must return 0
cakes({apples: 3, flour: 300, sugar: 150, milk: 100, oil: 100}, {sugar: 500, flour: 2000, milk: 2000}); 


**Data Structures**
- input Hashses { symbol: integer, symbol: integer } (recipe, stock)
- output Intger (number_of_cakes)



**Algorithm**
1. Initialize a Integer variable number_of_cakes and set it to nil
2. Iterate through recipe using #each ["ingreient", required_integer]
  - check to see how many times the stock amount of the "ingredient" can be divided by the required_integer
  - if that amount is less than number_of_cakes then update number of cakes UNLESS number_of_cakes == nil then set as the amount
  - if number of cakes ever equals zero, break and return zero
3. return number of cakes unless it equals nil in which case return zero



=end

def cakes(recipe, stock)
  number_of_cakes = nil
  
  recipe.each do |ingredient|
    item = ingredient[0]
    units = ingredient[1]
    
    return 0 if stock[item] == nil
    
    max_num = stock[item] / units
    if number_of_cakes == nil
      number_of_cakes = max_num
    elsif max_num < number_of_cakes
      number_of_cakes = max_num
    end    
  end
  p number_of_cakes
end



#basic recipes
p cakes({"flour"=>500, "sugar"=>200, "eggs"=>1},{"flour"=>1200, "sugar"=>1200, "eggs"=>5, "milk"=>200}) ==  2
p cakes({"cream"=>200, "flour"=>300, "sugar"=>150, "milk"=>100, "oil"=>100},{"sugar"=>1700, "flour"=>20000, "milk"=>20000, "oil"=>30000, "cream"=>5000}) == 11

#missing ingredient
p cakes({"apples"=>3, "flour"=>300, "sugar"=>150, "milk"=>100, "oil"=>100},{"sugar"=>500, "flour"=>2000, "milk"=>2000}) == 0

#not enough ingredient
p cakes({"apples"=>3, "flour"=>300, "sugar"=>150, "milk"=>100, "oil"=>100},{"sugar"=>500, "flour"=>2000, "milk"=>2000, "apples"=>15, "oil"=>20}) == 0

#no ingredients available
p cakes({"eggs"=>4, "flour"=>400},{}) == 0

#exactly enough ingredients
p cakes({"cream"=>1, "flour"=>3, "sugar"=>1, "milk"=>1, "oil"=>1, "eggs"=>1},{"sugar"=>1, "eggs"=>1, "flour"=>3, "cream"=>1, "oil"=>1, "milk"=>1}) == 1