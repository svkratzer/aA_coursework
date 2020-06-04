require_relative "piece"
require_relative  "slideable"

class Rook < Piece
  include Slideable
  def initialize(board, pos, color)
    super("R", board, pos, color)
  end

end

class Bishop < Piece
  include Slideable
  def initialize(board, pos, color)
    super("B", board, pos, color)
  end
end

class Queen < Piece
  include Slideable
  def initialize(board, pos, color)
    super("Q", board, pos, color)
  end
  
end

