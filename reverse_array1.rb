array1 = (1..11).to_a
array2 = %w(ape bear cat dog eagle fish grasshopper hippo)


def reverse_array(array)
  return_array = []
  
  array.each { |element| return_array.unshift(element) }
  return_array
end


def reverse_array!(array)
  
  count = -1
  (0...(array.size / 2)).each do |index|
    array[index], array[count] = array[count], array[index]
    count -= 1
  end
  array
end


p reverse_array!(array1)
p reverse_array!(array2)

array3 = %w(gith beholder dragon goblin ettin lyncantrope ogre mummy behir)
array4 = (1..100).to_a.sample(10)

def manual_sort!(array)
  sorted = nil

  
  until sorted == false
    sorted = false
    (0...array.size).each do |index|
      if array[index + 1] != nil && array[index] > array[index + 1]
        array[index], array[index + 1] = array[index + 1], array[index]
        sorted = true
      end
    end
  end
  array
end

def manual_sort(array)
  return_array = array.map { |element| element.dup }
  sorted = nil
  
  until sorted == false
    sorted = false
    (0...return_array.size).each do |index|
      if return_array[index + 1] != nil && return_array[index] > return_array[index + 1]
        return_array[index], return_array[index + 1] = return_array[index + 1], return_array[index]
        sorted = true
      end
    end
  end
  return_array
  
end

p manual_sort!(array3)
p manual_sort!(array4)

p manual_sort(array3)
p manual_sort(array4)