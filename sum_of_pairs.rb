require 'pry'

def sum_pairs(array, sum)
  pair = nil
  current_max_index = (array.size - 1)
  pairs = []

  (0...(array.size - 1)).each do |index|
    first_element = array[index]
    first_index = index
    
    ((index + 1)..(array.size - 1)).each do |second_index|
      second_element = array[second_index]
      if first_element + second_element == sum
        pairs << [second_index, [first_element, second_element]]
      end      
    end    
  end

  minimum_index = pairs.map { |p| p[0] }.min
  pairs.each do |p|

    if p[0] == minimum_index
       # binding.pry   
      pair = p[1]
    end
  end


  p pairs  
  p pair
end

l1= [1, 4, 8, 7, 3, 15]
l2= [1, -2, 3, 0, -6, 1]
l3= [20, -13, 40]
l4= [1, 2, 3, 4, 1, 0]
l5= [10, 5, 2, 3, 7, 5]
l6= [4, -2, 3, 3, 4]
l7= [0, 2, 0]
l8= [5, 9, 13, -3]


p sum_pairs(l1, 8) == [1, 7] # "Basic: ["+l1.join(", ")+"] should return [1, 7] for sum = 8"
p sum_pairs(l2, -6) == [0, -6] #, "Negatives: ["+l2.join(", ")+"] should return [0, -6] for sum = -6")
p sum_pairs(l3, -7) == nil # , "No Match: ["+l3.join(", ")+"] should return nil for sum = -7")
p sum_pairs(l4, 2) == [1, 1] #, "First Match From Left: ["+l4.join(", ")+"] should return [1, 1] for sum = 2 ")
p sum_pairs(l5, 10) == [3, 7] # "First Match From Left REDUX!: ["+l5.join(", ")+"] should return [3, 7] for sum = 10 ")
p sum_pairs(l6, 8) == [4, 4] # , "Duplicates: ["+l6.join(", ")+"] should return [4, 4] for sum = 8")
p sum_pairs(l7, 0) == [0, 0] # , "Zeroes: ["+l7.join(", ")+"] should return [0, 0] for sum = 0")
p sum_pairs(l8, 10) == [13, -3] # , "Subtraction: ["+l8.join(", ")+"] should return [13, -3] for sum = 10")