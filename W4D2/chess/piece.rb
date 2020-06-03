require_relative "slideable"

class Piece
    include Slideable # DELETE: ONLY FOR TESTING SLIDEABLE MODULE

    attr_reader :color
    def initialize(color)
        @color = color
        # @board =
        # @pos = 
        
    end 

    # Overwrites what we see when printing Pieces
    def inspect
        self.color
    end
        
end    