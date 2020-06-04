require_relative "piece"

class Knight < Piece
  def initialize(board, pos, color)
    super("H", board, pos, color)
  end
end

class King < Piece
  def initialize(board, pos, color)
    super("K", board, pos, color)
  end
end