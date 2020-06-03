require 'singleton'
require_relative 'piece'

class NullPiece < Piece
  include Singleton
  
  def initialize
  end
  
  # Overwrites what we see when printing NullPieces
  def inspect
    :_
  end    
end    