=begin
**Problem**
The grid is 6 row by 7 columns, those being named from A to G.

You will receive a list of strings showing the order of the pieces which dropped in columns:
    pieces_position_list = ["A_Red",
                          "B_Yellow",
                          "A_Red",
                          "B_Yellow",
                          "A_Red",
                          "B_Yellow",
                          "G_Red",
                          "B_Yellow"]

The list may contain up to 42 moves and shows the order the players are playing.

The first player who connects four items of the same color is the winner.

You should return "Yellow", "Red" or "Draw" accordingly.

Rules:
Explicit
  - Input: an Array of Strings up to 42 elements long
  - Output: String
  - The grid is 6 rows by 7 columns
  - Each column is named A to G
  - Each element of the input Array is a string consisting of the column name and piece color
  - elements are plays in order
  - the winner is the first player to connect 4 pieces (horizontal, vertical, or diagnol)

**Examples / Test Cases**
who_is_winner([
  "C_Yellow",
  "E_Red",
  "G_Yellow",
  "B_Red",
  "D_Yellow",
  "B_Red",
  "B_Yellow",
  "G_Red",
  "C_Yellow",
  "C_Red",
  "D_Yellow",
  "F_Red",
  "E_Yellow",
  "A_Red",
  "A_Yellow",
  "G_Red",
  "A_Yellow",
  "F_Red",
  "F_Yellow",
  "D_Red",
  "B_Yellow",
  "E_Red",
  "D_Yellow",
  "A_Red",
  "G_Yellow",
  "D_Red",
  "D_Yellow",
  "C_Red"] == "Yellow"

**Data Structures**
- Input Array
- Hash with letter / element combos
- Nested Array - each element is a column containing an array of pieces,
  [[roww0, row1, row2, row3, row4, row5, ], [roww0, row1, row2, row3, row4, row5, row6]]
  
    row 6     row 6     row 6
    row 5,    row 5,    row 5, 
    row 4,    row 4,    row 4, 
    row 3,    row 3,    row 3,
    row 2,    row 2,    row 2,
  [[row 1,], [row 1,], [row 1,], etc
      A         B         C

**Algorithm**
1. Iterate over the input array
2. split each element based on '_' character
3. Use first element containing a letter to find the value (index) in the hash 
4. use the value to determine what index position to push the 2nd element (color) to the board array


**Algorithm - Win Conditions**
1. start at board[0][0]
2. Get temporary win condition arrays
    - vertical win condition (only get if count is >= 4)
    - up diaganol (only get for rows 1 - 3)
    - down diaganol (only get for rows 4 - 6)
    - horizontal (only get for columns A - D)
3. If any win condtion Arrays contain winner, return winning string
=end

COLUMNS = { "A" => 0, "B" => 1, "C" => 2,
            "D" => 3, "E" => 4, "F" => 5,
            "G" => 6 
          }
          
=begin
***New-Algorithm
1. create board Array (7 columns of 6 rows)
2. set each row in every column to nil
3. iterate through each element of input array
  - update board with play definied in element
  - check board state for win condition
  - if win condition then return winner
  - else check next element
4. return winner

=end

def create_board
  board = []
  7.times { |element| board << [nil, nil, nil, nil, nil, nil] }
  board
end

=begin
**Update_board algortihm**
1. determine column to be udpated
  - use column vas key in the COLUMNS variable to get the correct index
2. determine row to be updated
  - check each row  at that index starting at index 0
  - once a row contains nil, replace nil with the color
4. return new board array
=end
require 'pry'

def update_board(column, color, board)
  column_index = COLUMNS[column]
  token_placed = false
  
  row = 0
  until token_placed == true || row > 5
    if board[column_index][row] == nil
      board[column_index][row] = color
      token_placed = true
    else
      row += 1
    end
  end
  board
end

def format_row(row)
  row.map! { |piece| piece != nil ? piece.center(6) : "nil".center(6) }

  row.join(" | ")
end

def display_board(board)
  
  6.times do |int|
    row = 5 - int
    
    current_row =[]
    board.each { |column| current_row << column[row] }
    p current_row = format_row(current_row)
  end
  
end
          
def who_is_winner(array)
  board = create_board
  

  array.each do |play|
    column = play.split('_')[0]
    color = play.split('_')[1]
    # binding.pry
    board = update_board(column, color, board)
    puts " "
  end
  display_board(board)
  board
  
end







p who_is_winner([ "A_Red",
  "B_Yellow",
  "A_Red",
  "B_Yellow",
  "A_Red",
  "B_Yellow",
  "G_Red",
  "B_Yellow"]) == "Yellow"
  
# p who_is_winner([ "A_Yellow",
#   "B_Red",
#   "B_Yellow",
#   "C_Red",
#   "C_Yellow",
#   "D_Red",
#   "C_Yellow",
#   "D_Red",
#   "E_Yellow",
#   "D_Red",
#   "D_Yellow"]) == "Yellow"
  
# p who_is_winner([ "A_Red",
#   "B_Yellow",
#   "A_Red",
#   "E_Yellow",
#   "F_Red",
#   "G_Yellow",
#   "A_Red",
#   "G_Yellow"]) == "Draw"


# p who_is_winner([
#   "C_Yellow",
#   "E_Red",
#   "G_Yellow",
#   "B_Red",
#   "D_Yellow",
#   "B_Red",
#   "B_Yellow",
#   "G_Red",
#   "C_Yellow",
#   "C_Red",
#   "D_Yellow",
#   "F_Red",
#   "E_Yellow",
#   "A_Red",
#   "A_Yellow",
#   "G_Red",
#   "A_Yellow",
#   "F_Red",
#   "F_Yellow",
#   "D_Red",
#   "B_Yellow",
#   "E_Red",
#   "D_Yellow",
#   "A_Red",
#   "G_Yellow",
#   "D_Red",
#   "D_Yellow",
#   "C_Red"]) ==  "Yellow"
          
# p who_is_winner(["C_Yellow",
#   "B_Red",
#   "B_Yellow",
#   "E_Red",
#   "D_Yellow",
#   "G_Red",
#   "B_Yellow",
#   "G_Red",
#   "E_Yellow",
#   "A_Red",
#   "G_Yellow",
#   "C_Red",
#   "A_Yellow",
#   "A_Red",
#   "D_Yellow",
#   "B_Red",
#   "G_Yellow",
#   "A_Red",
#   "F_Yellow",
#   "B_Red",
#   "D_Yellow",
#   "A_Red",
#   "F_Yellow",
#   "F_Red",
#   "B_Yellow",
#   "F_Red",
#   "F_Yellow",
#   "G_Red",
#   "A_Yellow",
#   "F_Red",
#   "C_Yellow",
#   "C_Red",
#   "G_Yellow",
#   "C_Red",
#   "D_Yellow",
#   "D_Red",
#   "E_Yellow",
#   "D_Red",
#   "E_Yellow",
#   "C_Red",
#   "E_Yellow",
#   "E_Red"]) ==  "Yellow"
  
# p who_is_winner(["F_Yellow",
#     "G_Red",
#     "D_Yellow",
#     "C_Red",
#     "A_Yellow",
#     "A_Red",
#     "E_Yellow",
#     "D_Red",
#     "D_Yellow",
#     "F_Red",
#     "B_Yellow",
#     "E_Red",
#     "C_Yellow",
#     "D_Red",
#     "F_Yellow",
#     "D_Red",
#     "D_Yellow",
#     "F_Red",
#     "G_Yellow",
#     "C_Red",
#     "F_Yellow",
#     "E_Red",
#     "A_Yellow",
#     "A_Red",
#     "C_Yellow",
#     "B_Red",
#     "E_Yellow",
#     "C_Red",
#     "E_Yellow",
#     "G_Red",
#     "A_Yellow",
#     "A_Red",
#     "G_Yellow",
#     "C_Red",
#     "B_Yellow",
#     "E_Red",
#     "F_Yellow",
#     "G_Red",
#     "G_Yellow",
#     "B_Red",
#     "B_Yellow",
#     "B_Red"]) == "Red"
    
# p who_is_winner(["A_Yellow",
#   "B_Red",
#   "B_Yellow",
#   "C_Red",
#   "G_Yellow",
#   "C_Red",
#   "C_Yellow",
#   "D_Red",
#   "G_Yellow",
#   "D_Red",
#   "G_Yellow",
#   "D_Red",
#   "F_Yellow",
#   "E_Red",
#   "D_Yellow"]) ==  "Red"