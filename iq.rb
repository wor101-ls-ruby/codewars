def iq_test(numbers)
  odd = [0, 0]
  even = [0, 0]
  
  array = numbers.split(' ').map { |num| num.to_i }
  
  array.each_with_index do |int, index|
    if int.odd?
      odd[0] += 1
      odd[1] = index
    else
      even[0] += 1
      even[1] = index
    end
  end

p odd
p even

  if odd[0] == 1
    odd[1] + 1
  else
    even[1] + 1
  end
  
end


p iq_test("2 4 7 8 10") == 3
p iq_test("1 2 2") == 1