require_relative 'tic_tac_toe'

class TicTacToeNode
  attr_reader :board, :next_mover_mark, :prev_move_pos

  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end


  
  def children
    children = []
    @board.rows.each_with_index do |row, i|
      row.each_with_index do |pos, j|
        if pos.nil?
          new_board = @board.dup
          new_board.rows[i][j] = @next_mover_mark
          mover_mark = @next_mover_mark == :x ? :o : :x
          children << TicTacToeNode.new(new_board, mover_mark, [i, j])
        end
      end
    end
    children
  end


  require "byebug"
  def losing_node?(evaluator)
    if @board.over?
      return false if @board.tied? || @board.winner == evaluator
      return true if @board.winner != evaluator
    end

    if evaluator != @next_mover_mark
      self.children.any? { |child| child.losing_node?(evaluator) }
    else
      self.children.all? { |child| child.losing_node?(evaluator) }
    end
    
  end

  def winning_node?(evaluator)
    if @board.over?
      return false if @board.tied? || @board.winner != evaluator
      return true if @board.winner == evaluator
    end

    if evaluator == @next_mover_mark
      self.children.any? { |child| child.winning_node?(evaluator) }
    else
      self.children.all? { |child| child.winning_node?(evaluator) }
    end
  end
end

# [X] [ ] [ ]
# [ ] [ ] [ ]
# [ ] [ ] [ ]

