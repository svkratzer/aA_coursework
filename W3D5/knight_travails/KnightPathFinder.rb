require "../polytree_project/lib/00_tree_node.rb"

class KnightPathFinder

    def self.valid_moves(pos)
        moves = self.possible_moves(pos)
        moves.select do |move|
            move.all? {|num| num > -1 && num < 8}
        end
    end

    def self.possible_moves(pos)
        row, col = pos
        [[row - 2, col - 1], [row - 2, col + 1],
        [row - 1, col - 2], [row - 1, col + 2],
        [row + 1, col - 2], [row + 1, col + 2],
        [row + 2, col - 1], [row + 2, col + 1]]
    end

    def initialize(pos)
        @pos = pos
        @root_node = PolyTreeNode.new(pos)
        @considered_positions = [pos]
    end

    def new_move_positions(pos)
        moves = KnightPathFinder.valid_moves(pos)
        new_moves = moves.reject { |move| @considered_positions.include?(move) }
        @considered_positions += new_moves
        new_moves
    end

    def build_move_tree
    end
    
    def find_path(final_pos)
    end
end


kpf = KnightPathFinder.new([0, 0])
# p kpf.possible_moves([0,0])
p KnightPathFinder.valid_moves([3,7])

# board = Array.new(8) { Array.new(8, "[ ]") }
# board.each { |row| p row.join(" "); puts }
# (0..7).each { |i| print "#{i} "}

# "    0   1   2   3   4   5   6   7 "
# " 0 [ ] [ ] [ ] [ ] [ ] [ ] [ ] [ ]"

# " 1 [ ] [ ] [ ] [ ] [ ] [ ] [P] [ ]"

# " 2 [ ] [ ] [ ] [ ] [ ] [P] [ ] [ ]"

# " 3 [ ] [ ] [ ] [ ] [ ] [ ] [ ] [K]"

# " 4 [ ] [ ] [ ] [ ] [ ] [P] [ ] [ ]"

# " 5 [ ] [ ] [ ] [ ] [ ] [ ] [P] [ ]"

# " 6 [ ] [ ] [ ] [ ] [ ] [ ] [ ] [ ]"

# " 7 [ ] [ ] [ ] [ ] [ ] [ ] [ ] [ ]"


# [3,3] -> [1,2], [1,4], [2,1], [2,5], [4,1], [4,5], [5,2], [5,4]

# possible_rows => row - 1, row - 2, row + 1, row + 2
# possible_cols => col - 1, col - 2, col + 1, col + 2

# [[row - 2, col - 1], [row - 2, col + 1],
#  [row - 1, col - 2], [row - 1, col + 2],
#  [row + 1, col - 2], [row + 1, col + 2],
#  [row + 2, col - 1], [row + 2, col + 1]]



