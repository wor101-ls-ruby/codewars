

def is_valid_walk(walk)
  latitude = 0
  longitude = 0
  
  return false if walk.size > 10 || walk.size < 10
  
  walk.each do |direction|

    case direction
    when 'n'
      latitude += 1
    when 's'
      latitude -= 1
    when 'e'
      longitude += 1
    when 'w'
      longitude -= 1
    end    
  end 
  p latitude
  p longitude
  latitude == 0 && longitude == 0 ? true : false


end


#some test cases for you...
# p is_valid_walk(['n','s','n','s','n','s','n','s','n','s']) == true
# p is_valid_walk(['w','e','w','e','w','e','w','e','w','e','w','e']) == false
# p is_valid_walk(['w']) == false
p is_valid_walk(['n','n','n','s','n','s','n','s','n','s']) == false