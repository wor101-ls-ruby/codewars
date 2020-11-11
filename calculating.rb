def one(operation = 1)
  value = 1
  case operation[0]
  when '+' then value + operation[1]
  when '-' then value - operation[1]
  when '*' then value * operation[1]
  when '/' then value / operation[1]
  else value
  end
end

def two(operation = 2)
  value = 2
  case operation[0]
  when '+' then value + operation[1]
  when '-' then value - operation[1]
  when '*' then value * operation[1]
  when '/' then value / operation[1]
  else value
  end
end

def three(operation = 3)
  value = 3
  case operation[0]
  when '+' then value + operation[1]
  when '-' then value - operation[1]
  when '*' then value * operation[1]
  when '/' then value / operation[1]
  else value
  end
end

def four(operation = 4)
  value = 4
  case operation[0]
  when '+' then value + operation[1]
  when '-' then value - operation[1]
  when '*' then value * operation[1]
  when '/' then value / operation[1]
  else value
  end
end

def five(operation = 5)
  value = 5
  case operation[0]
  when '+' then value + operation[1]
  when '-' then value - operation[1]
  when '*' then value * operation[1]
  when '/' then value / operation[1]
  else value
  end
end

def six(operation = 6)
  value = 6
  case operation[0]
  when '+' then value + operation[1]
  when '-' then value - operation[1]
  when '*' then value * operation[1]
  when '/' then value / operation[1]
  else value
  end
end

def seven(operation = 7)
  value = 7
  case operation[0]
  when '+' then value + operation[1]
  when '-' then value - operation[1]
  when '*' then value * operation[1]
  when '/' then value / operation[1]
  else value
  end
end

def eight(operation = 8)
  value = 8
  case operation[0]
  when '+' then value + operation[1]
  when '-' then value - operation[1]
  when '*' then value * operation[1]
  when '/' then value / operation[1]
  else value
  end
end

def nine(operation = 9)
  value = 9
  case operation[0]
  when '+' then value + operation[1]
  when '-' then value - operation[1]
  when '*' then value * operation[1]
  when '/' then value / operation[1]
  else value
  end
end

def plus(right_operand)
  ['+', right_operand]
end

def minus(right_operand)
  ['-', right_operand]
end 

def times(right_operand)
  ['*', right_operand]
end

def divided_by(right_operand)
  ['/', right_operand]
end



p seven(times(five)) == 35
p four(plus(nine)) == 13
p eight(minus(three)) == 5
p six(divided_by(two)) == 3


p one(plus(one))
p one(divided_by(4))