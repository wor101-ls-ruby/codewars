=begin
**Problem**

robot1 = {
  "name" => "Rocky",
  "health" => 100,
  "speed" => 20,
  "tactics" => ["punch", "punch", "laser", "missile"]
 }
 robot2 = {
   "name" => "Missile Bob",
   "health" => 100,
   "speed" => 21,
   "tactics" => ["missile", "missile", "missile", "missile"]
 }
 tactics = {
   "punch" => 20,
   "laser" => 30,
   "missile" => 35
 }

 fight(robot1, robot2, tactics) # "Missile Bob has won the fight."

robot2 uses the first tactic, "missile" because he has the most speed. This reduces robot1's health by 35. Now robot1 uses a punch, and so on.

Rules:
- A robot with the most speed attacks first. If they are tied, the first robot passed in attacks first.
- Robots alternate turns attacking. Tactics are used in order.
- A fight is over when a robot has 0 or less health or both robots have run out of tactics.
- A robot who has no tactics left does no more damage, but the other robot may use the rest of his tactics.
- If both robots run out of tactics, whoever has the most health wins. Return the message "{Name} has won the fight."
- If both robots run out of tactics and are tied for health, the fight is a draw. Return "The fight was a draw."

Rules:
Explicit
  - Input: Three hashes
  - Output: output a string

**Examples / Test Cases**
 fight(robot1, robot2, tactics) # "Missile Bob has won the fight."

**Data Structures**
- Hashes representing each robot
- Hash representing tactics
- string to be dispalyed
- string representing winners name

**Algorithm**
1. Set robot hashes
2. Set tactics hash
3. Initialize variable called winner and set to nil
4. Initialize variable called current_fighter and set to robot's name with highest speed
4. While winner is false
  - current_fighter uses first tactic and loses it
  - opposing robot loses hp 
  - if hp for either robot is equal to or less than 0 set winner to current_fighters name and break
  - else set current_fighter to opposing robot
5. puts to screen "#{winner} has won the fight."

=end

def all_out_of_tactics(attacking_fighter, defending_fighter)
  if attacking_fighter['health'] > defending_fighter['health'] 
    attacking_fighter['name'] 
  elsif attacking_fighter['health'] < defending_fighter['health'] 
    defending_fighter['name']
  else
    'draw'
  end
end


def fight(robot1, robot2, tactics)
  winner = nil
  attacking_fighter = nil
  defending_fighter = nil
  
  if robot1['speed'] >= robot2['speed']  
    attacking_fighter, defending_fighter = robot1, robot2 
  else
    attacking_fighter, defending_fighter = robot2, robot1
  end

  while winner == nil
    if attacking_fighter['tactics'].size <= 0 && defending_fighter['tactics'].size <= 0
      winner = all_out_of_tactics(attacking_fighter, defending_fighter)
      # if attacking_fighter['health'] > defending_fighter['health'] 
      #   winner = attacking_fighter['name'] 
      # elsif attacking_fighter['health'] < defending_fighter['health'] 
      #   winner = defending_fighter['name']
      # else
      #   winner = 'draw'
      # end
    elsif attacking_fighter['tactics'].size <= 0
      attacking_fighter, defending_fighter = defending_fighter, attacking_fighter
    else
      defending_fighter['health'] -=  tactics[attacking_fighter['tactics'].shift]
      if defending_fighter['health'] <= 0 
        winner = attacking_fighter['name']
        break
      end
      attacking_fighter, defending_fighter = defending_fighter, attacking_fighter
    end
  end
  
  if winner == 'draw' 
    p "The fight was a draw." 
  else
    p "#{winner} has won the fight."
  end
  
  
end


robot1 = {
  "name" => "Rocky",
  "health" => 100,
  "speed" => 20,
  "tactics" => ["punch", "punch", "laser", "missile"]
 }
 robot2 = {
   "name" => "Missile Bob",
   "health" => 100,
   "speed" => 21,
   "tactics" => ["missile", "missile", "missile", "missile"]
 }
 tactics = {
   "punch" => 20,
   "laser" => 30,
   "missile" => 35
 }

p fight(robot1, robot2, tactics) == "Missile Bob has won the fight."
