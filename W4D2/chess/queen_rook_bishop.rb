require_relative "piece"
require_relative  "slideable"

class Rook < Piece
  include Slideable

end

class Bishop < Piece
  include Slideable

end

  
class Queen < Piece
  include Slideable
  
end