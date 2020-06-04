require_relative "piece"

class Pawn < Piece
  def initialize(board, pos, color)
    super("P", board, pos, color)
  end
  
end