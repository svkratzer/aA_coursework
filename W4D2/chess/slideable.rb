require_relative "board"
require 'byebug'
module Slideable

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
    moves_by_dirs(start_pos, HORIZONTAL_STEPS)
  end 
  
  #return an array of all possible diagonal moves from a given start position
  def diagonal_dirs(start_pos)
    moves_by_dirs(start_pos, DIAGONAL_STEPS)
  end  


  private
  
  def moves_by_dirs(start_pos, direction)
    moves = [start_pos]
    direction.each do |step|
      until moves.last.any? {|index| !index.between?(0,7) }
        new_move = moves.last.dup
        new_move[0] += step[0]
        new_move[1] += step[1]
        moves << new_move
      end
      moves.pop
      moves << start_pos
    end
    moves.uniq
  end  


end




if __FILE__ == $PROGRAM_NAME

  class Test
    include Slideable
    def initialize; end
  end

  test = Test.new 
  p test.horizontal_dirs([3,3])
  p test.diagonal_dirs([3,3])
end


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

=end