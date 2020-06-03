require_relative "board"
require 'byebug'
module Slideable

  # [delta_row, delta_col]
  # pos [3, 3], left_move [0, -1]
  # pos[0] += left_move[0], pos[1] += left_move[1]

  HORIZONTAL_STEPS = [
  [0, -1], # left
  [0, 1], # right
  [-1, 0], # up
  [1, 0]  # down
].freeze

 DIAGONAL_STEPS = [
  [-1, -1], #up + left
  [-1, 1], #up + right
  [1, -1], #down + left
  [1, 1]  #down + right
].freeze 

  def moves(start_pos)
    start_row, start_col = start_pos
    end_row, end_col = end_pos

    if start_row == end_row # If the move is horizontal...
      #horizontal_dirs
    elsif start_col == end_col # If the move is vertical...
      #vertical_dirs
    else
      #diagonal_dirs
    end    

  end  
  
  #return an array of all possible horizontal moves from a given start position
  def horizontal_dirs(start_pos)
    moves = [start_pos]
    debugger
    HORIZONTAL_STEPS.each do |step|
      move = start_pos.dup
      until moves.last.any? {|index| !index.between?(0,7) }
        new_move = moves.last.dup
        new_move[0] += step[0]
        new_move[1] += step[1]
        moves << new_move
      end
      # until move.any? {|index| !index.between?(0,7) }
      
      # end
    end
    moves
  end 
        #tbd on side logic (opponent vs ours) -------------------
        # if board[move].is_a?(Piece) && piece == opponent_piece
        #   moves << move
        #   break
        # elsif board[move].is_a?(Piece) && piece != opponent_piece
        #   move[0] -= step[0]
        #   move[1] -= step[1]
        #   moves << move
        #    break
        # end  
   
      # the following takes a step back, once we've moved off the edge of the board

     

  def diagonal_dirs(start_pos)
    moves = []
    #return an array of all possible diagonal moves from a given start position
    up_left = DIAGONAL_STEPS[0]
    up_right = DIAGONAL_STEPS[1]
    down_left = DIAGONAL_STEPS[2]
    down_right = DIAGONAL_STEPS[3]
  end  

end

class Test
  include Slideable
  def initialize; end
end


if __FILE__ == $PROGRAM_NAME
  test = Test.new 
  test.horizontal_dirs([3,3])
end
# ROOK _ _ _ _ _ QUEEN


=begin

    0  1  2  3  4  5  6  7
 0 [P, P, P, P, P, P, P, P]
 1 [P, N, P, P, P, P, P, P]
 2 [N, N, N, N, N, N, N, N]  
 3 [N, N, N, N, N, N, N, N]
 4 [N, N, N, N, N, P, N, N]
 5 [N, N, N, N, N, N, N, N]
 6 [P, P, P, P, P, P, P, P]
 7 [P, P, P, P, P, P, P, P]

 grid[i][j] when i == j then this diagonal \
 grid[i][j] when j = row.length - 1 - i then this diaogonal /

[0,1], [1,0]
[2,0], [1,1], [0,2]
[3,0], [2,1], [1,2], [0,3]
[4,0], [3,1], [2,2], [1,3], [0,4] #they always sum to the num eles in diag


=end