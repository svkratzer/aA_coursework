module Slideable

  # [delta_row, delta_col]
  # pos [3, 3], left_move [0, -1]
  # pos[0] += left_move[0], pos[1] += left_move[1]

  HORIZONTAL_STEPS = [
  [0, -1], # left
  [0, 1], # right
  [-1, 0], # up
  [1, 0]  # down
].freeze

 VERTICAL_STEPS = [
  [-1, -1], #up + left
  [-1, 1], #up + right
  [1, -1], #down + left
  [1, 1]  #down + right
].freeze 

  def slide_move(start_pos, end_pos)
    start_row, start_col = start_pos
    end_row, end_col = end_pos

    if start_row == end_row # If the move is horizontal...
      #horizontal_dirs
    elsif start_col == end_col # If the move is vertical...
      #vertical_dirs
    else
      #diagonal_dirs
    end    

  end  

  def horizontal_dirs

  end  

end



=begin

    0  1  2  3  4  5  6  7
 0 [P, P, P, P, P, P, P, P]
 1 [P, N, P, P, P, P, P, P]
 2 [N, N, N, N, N, N, N, N]  
 3 [N, N, N, N, N, N, N, N]
 4 [N, N, N, N, N, P, N, N]
 5 [N, N, N, N, N, N, N, N]
 6 [P, P, P, P, P, P, P, P]
 7 [P, P, P, P, P, P, P, P]

 grid[i][j] when i == j then this diagonal \
 grid[i][j] when j = row.length - 1 - i then this diaogonal /

[0,1], [1,0]
[2,0], [1,1], [0,2]
[3,0], [2,1], [1,2], [0,3]
[4,0], [3,1], [2,2], [1,3], [0,4] #they always sum to the num eles in diag


=end