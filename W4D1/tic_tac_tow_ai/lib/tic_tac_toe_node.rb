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

  def losing_node?(evaluator)
  end

  def winning_node?(evaluator)
  end

  # # This method generates an array of all moves that can be made after
  # # the current move.
  # def children
  # end
end

