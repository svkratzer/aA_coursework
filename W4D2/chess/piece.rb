require_relative "slideable"
require_relative "board"

class Piece
    include Slideable
    
    attr_reader :color, :board
    def initialize(color, board, pos)
        @color = color # either :B or :W depending on side
        @board = board # an instance of board
        @pos = pos # an array containing its position on board
    end 

    # Overwrites what we see when printing Pieces
    def inspect
        self.color
    end
        
end    


=begin
    # IF THE POSITION CONTAINS ONE OF OUR PIECES
    if grid[new_move[0]][new_move[1]].color == self.color && grid[new_move[0]][new_move[1]].is_a?(Piece)
        break
    # IF THE POSITION CONTAINS ONE OF OUR OPPONENTS PIECES
    elsif grid[new_move[0]][new_move[1]].color != self.color && grid[new_move[0]][new_move[1]].is_a?(Piece)
        moves << new_move
        break
    # IF THE POSITION CONTAINS A NULLPIECE (EMPTY SPACE)
    else
        moves << new_move  
    end
=end