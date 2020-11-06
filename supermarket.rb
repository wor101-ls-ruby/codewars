


def queue_time(customers, n)
  tills = Array.new(n)
  clock = 0
  
  return 0 if customers == []
  return customers.sum if n == 1
  return customers.max if n >= customers.size
  
  # fill initial tills
  n.times do |i|
    tills[i] = customers.shift  
  end
  p tills
  # loop to see how long it takes for tills to open up and add new customer
  loop do
    break if tills.all? { |customer| customer == 0 }  && customers == []
    
    tills.map! { |customer| customer -= 1 }
    clock += 1
    tills.select! { |customer| customer != 0 }

    until tills.size == n || customers == [] 
      tills << customers.shift  
    end

    # end 
    p tills
    
  end
 p clock
end



p queue_time([], 1) == 0
p queue_time([5], 1) == 5
p queue_time([2], 5) == 2
p queue_time([1,2,3,4,5], 1) == 15
p queue_time([1,2,3,4,5], 100) == 5
p queue_time([2,2,3,3,4,4], 2) == 9