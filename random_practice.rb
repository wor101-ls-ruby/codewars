require 'pry'

def reverse_array(array)
  return_array = []
  
  array.each { |element| return_array.unshift(element) }
  return_array
end

def reverse_array!(array)
  count = -1
  (0..(array.size / 2)).each do |index|
    array[index], array[count] = array[count], array[index]
    count -= 1
  end
  array
end


def manual_sort(array)
  return_array = array.map { |element| element.dup }

  sorted = nil
  until sorted == false
    sorted = false
    (0...(return_array.size)).each do |index|
      if (array[index + 1] != nil) &&  return_array[index] > return_array[index + 1]

        return_array[index], return_array[index + 1] = return_array[index + 1], return_array[index]
        sorted = true
      end
    end
  end
  return_array
end

def manual_sort!(array)
  p array.object_id
  sorted = nil
  until sorted == false
    sorted = false
    (0...(array.size - 1)).each do |index|
      if array[index] > array[index + 1]
        array[index], array[index + 1 ] = array[index + 1], array[index]
        sorted = true
      end
    end
  end
  p array.object_id
end








array1 = (1..11).to_a.reverse

array2 = %w(ape bear cat dog eagle falcon giraffe hippo iguana).reverse

array3 = (1..100).to_a.sample(10)


# p reverse_array(array1)
# p reverse_array(array2)
# p reverse_array(array3)
# p reverse_array!(array1)
# p reverse_array!(array2)
# p reverse_array!(array3)

# p manual_sort!(array1)
# p manual_sort!(array2)
# p manual_sort!(array3)

p array3.sort { |a, b| b <=> a }

p array2.sort_by { |animal| animal.size } 
p array2.sort_by { |animal| animal[1] } 
p array2.sort { |a, b| b[1] <=> a[1] }