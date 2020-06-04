require_relative "piece"
require_relative "null_piece"
require "colorize"

class Board
    attr_reader :grid
    def initialize
    @grid = Array.new(8) {Array.new(8)} # creates grid skeleton
    fill_grid # populates board
    end 
    
    def [](position)
      row, col = position
      @grid[row][col]
    end  
    
    def []=(position, piece)
      row, col = position
      @grid[row][col] = piece
    end  

    def move_piece(start_pos, end_pos)
      start_row, start_col = start_pos
      end_row, end_col = end_pos

      # IF THERE IS A PIECE
      if !end_row.between?(0,7) || !end_col.between?(0,7) || !start_row.between?(0,7) || !start_col.between?(0,7)
        raise ArgumentError.new "Start or end position beyond the bounds of the board"

      elsif self.grid[start_row][start_col].is_a?(Piece) # Tests if pos has a piece
        piece = self.grid[start_row][start_col] # Saves piece as reference pointing to Piece instance
        self.grid[start_row][start_col] = NullPiece.instance # Replaces start_pos with NullPiece (no more piece)
        self.grid[end_row][end_col] = piece # Places piece on the desired end_pos  

      else
        # Raises error if the start_pos does not contain Piece
        raise ArgumentError.new "Start position does not contain a piece"
      end      
      
    end    

    private


    # Fills the grid with Pieces
    def fill_grid
      # Fills the first players side with Pieces

      # Fill the white back line
      # self[[0,0]], self[[0,7]] = Rook.new(self, [0,0], :W), Rook.new(self, [0,7], :W)
      # self[[0,1]], self[[0,6]] = Knight.new(self, [0,1], :W), Knight.new(self, [0,6], :W)
      # self[[0,2]], self[[0,5]] = Bishop.new(self, [0,2], :W), Bishop.new(self, [0,5], :W)
      # self[[0,2]] = Queen.new(self, [0,3], :W)
      # self[[0,4]] = King.new(self, [0,4], :W)

      self.grid[0..1].each_with_index do |row, i_1|
        row.each_with_index { |pos, i_2| row[i_2] = Piece.new(:W, self, [i_1, i_2])}
      end

      #Fills the middle with instances of NullPiece
      null = NullPiece.instance
      self.grid[2..5].each_with_index do |row, i_1|
        row.each_with_index { |pos, i_2| row[i_2] = null}
      end
      
      self.grid[6..7].each_with_index do |row, i_1|
        row.each_with_index { |pos, i_2| row[i_2] = Piece.new(:B, self, [i_1, i_2])}
      end           
    end    

end    


if __FILE__ == $PROGRAM_NAME


# board.grid.each { |row| p row }
# puts 
# board.move_piece([1,1], [4,5])
# board.grid.each { |row| p row }
# puts

#r = Rook.new(self, [0,0], :W)

#p = Piece.new(, self, [0,0], :W)

# Sliding pieces (Bishop/Rook/Queen)
# Stepping pieces (Knight/King)
# Null pieces (occupy the 'empty' spaces)
# Pawns (we'll do this class last)

#     0    1    2    3    4    5    6    7
# 0 [nil, nil, nil, nil, nil, nil, nil, nil]
# 1 [nil, nil, nil, nil, nil, nil, nil, nil]
# 2 [nil, nil, nil, nil, nil, nil, nil, nil]
# 3 [nil, nil, nil, nil, nil, nil, nil, nil]
# 4 [nil, nil, nil, nil, nil, nil, nil, nil]
# 5 [nil, nil, nil, nil, nil, nil, nil, nil]
# 6 [nil, nil, nil, nil, nil, nil, nil, nil]
# 7 [nil, nil, nil, nil, nil, nil, nil, nil]

end