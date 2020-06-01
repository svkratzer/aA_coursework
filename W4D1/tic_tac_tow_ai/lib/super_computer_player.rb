require_relative 'tic_tac_toe_node'

class SuperComputerPlayer < ComputerPlayer
  def move(game, mark)
    node = TicTacToeNode.new(game.board, mark)
    # game.show
    # puts 

    node.children.shuffle.each do |child|
      return child.prev_move_pos if child.winning_node?(mark)
    end

    node.children.shuffle.each do |child|
      return child.prev_move_pos if !child.losing_node?(mark)
    end

    raise "ERROR DANGER DANGER"
    
  end
end

if __FILE__ == $PROGRAM_NAME
  puts "Play the brilliant computer!"

  cp1 = SuperComputerPlayer.new
  cp2 = SuperComputerPlayer.new
  
  

  TicTacToe.new(cp1, cp2).run
end
