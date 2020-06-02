require_relative "piece"
require_relative "null_piece"

class Board
    attr_reader :grid
    def initialize
    @grid = Array.new(8) {Array.new(8)}
    fill_grid
    end 
    
    def move_piece(start_pos, end_pos)
      
    end    

    private

    # Fills the grid with Pieces
    def fill_grid
      # Fills the first players side with Pieces
      self.grid[0..1].each do |row|
        row.each_with_index { |pos, i| row[i] = Piece.new}
      end
      #Fills the middle with NullPieces
      self.grid[2..5].each do |row|
        row.each_with_index { |pos, i| row[i] = NullPiece.new}
      end
      #Fills the second players side with Pieces
      self.grid[6..7].each do |row|
        row.each_with_index { |pos, i| row[i] = Piece.new}
      end           
    end    

end    

board = Board.new
board.grid.each { |row| p row }

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