=begin
**Problem**
Your granny, who lives in town X0, has friends. These friends are given in an array, for example: array of friends is
  [ "A1", "A2", "A3", "A4", "A5" ].

The order of friends is this array must not be changed since this order gives the order in which they will be visited.

These friends inhabit towns and you have an array with friends and towns, for example:

  [ ["A1", "X1"], ["A2", "X2"], ["A3", "X3"], ["A4", "X4"] ]

  
which means A1 is in town X1, A2 in town X2... It can happen that we don't know the town of one of the friends.

Your granny wants to visit her friends and to know how many miles she will have to travel.

You will make the circuit that permits her to visit her friends. For example here the circuit will contain:
  X0, X1, X2, X3, X4, X0 
and you must compute the total distance
  X0X1 + X1X2 + .. + X4X0.

For the distance, fortunately, you have a map (and a hashmap) that gives each distance X0X1, X0X2 and so on. For example:
  [ ["X1", 100.0], ["X2", 200.0], ["X3", 250.0], ["X4", 300.0] ]

which means that X1 is at 100.0 miles from X0, X2 at 200.0 miles from X0, etc...

More fortunately (it's not real life, it's a story...), the towns X0, X1, ..Xn are placed in the following manner:

X0X1X2 is a right triangle with the right angle in X1, X0X2X3 is a right triangle with the right angle in X2, etc...

If a town Xi is not visited you will suppose that the triangle

X0Xi-1Xi+1 is still a right triangle.

(Ref: https://en.wikipedia.org/wiki/Pythagoras#Pythagorean_theorem)

Can you help your granny and give her the distance to travel?


Rules:
Explicit
  - Input: array of strings, array of arrays, hash
  - Output: integer or floating point number
  - calculate the total distance granny must travel
  - use a**2 + b**2 = c**2
  - we know what a and c are for each triangle
  - we need to calculate what b is for each triangle
  - add a for first triangle and c for last triangle
  - number of triangles is one less than the number of friends
**Examples / Test Cases**


**Data Structures**
friends1 = ["A1", "A2", "A3", "A4", "A5"]
fTowns1 = [["A1", "X1"], ["A2", "X2"], ["A3", "X3"], ["A4", "X4"]]
distTable1 = Hash["X1", 100.0, "X2", 200.0, "X3", 250.0, "X4", 300.0]

triangles = [ [sideA, sideB, sideC], [sideA, sideB, sideC]]

**Algorithm**
1. Initialize an Array variable with of a size 1 less than friends to represent triangles
2.  Use hash with distances to create the triangles and add to array
3. iterate oveer the friends array to determine the distances we are traveling

=end

def create_triangle(sideA = nil, sideB = nil, sideC = nil)
  triangle = [sideA, sideB, sideC]
  if sideC == nil
    triangle[2] = Math.sqrt(sideA**2 + sideB**2)
  elsif sideA == nil
    triangle[0] = Math.sqrt(sideC**2 - sideB**2)
  else
    triangle[1] = Math.sqrt(sideC**2 - sideA**2)
  end
  triangle
end

def tour(friends1, fTowns1, distTable1)
  triangles = Array.new(distTable1.size - 1)
  total_distance = 0
  
  create_triangle(nil, 6, 12)
  distTable1.to_a.each_with_index do |side, index|
    if index >= (distTable1.size - 1)
      break
    else
      triangles[index] = create_triangle(side[1], nil, distTable1.to_a[index + 1][1])
    end
  end
  
  sideb_total = 0
  triangles.each { |triangle| sideb_total += triangle[1] }
  p (sideb_total + triangles.first[0] + triangles.last[2]).round

end



friends1 = ["A1", "A2", "A3", "A4", "A5"]
fTowns1 = [["A1", "X1"], ["A2", "X2"], ["A3", "X3"], ["A4", "X4"]]
distTable1 = Hash["X1", 100.0, "X2", 200.0, "X3", 250.0, "X4", 300.0]


p tour(friends1, fTowns1, distTable1) == 889