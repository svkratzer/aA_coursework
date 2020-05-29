require "../polytree_project/lib/00_tree_node.rb"

class KnightPathFinder
    
    attr_reader :considered_positions

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
      queue = [@root_node]
      until queue.empty?
        curr_node = queue.shift
        moves = self.new_move_positions(curr_node.value)
        moves.each do |move|
          curr_node.add_child(PolyTreeNode.new(move))
        end
        queue += curr_node.children
      end
    end
    

    def find_path(final_pos)
        final_node = @root_node.bfs(final_pos)
        trace_path_back(final_node).reverse
    end

    # def trace_non_rec(node)
    #     path = []
    #     until node.parent == nil
    #         path << node.value
    #         node = node.parent
    #     end
    #     path << node.value
    #     path
    # end

    def trace_path_back(node)
        return [node.value] if node.parent.nil?
        trace = [node.value]
        trace += trace_path_back(node.parent)
    end


end


kpf = KnightPathFinder.new([0, 0])
kpf.build_move_tree
p kpf.find_path([7, 6]) # => [[0, 0], [1, 2], [2, 4], [3, 6], [5, 5], [7, 6]]
p kpf.find_path([6, 2]) # => [[0, 0], [1, 2], [2, 0], [4, 1], [6, 2]]

# kpf = KnightPathFinder.new([0, 0])
# kpf.build_move_tree
# p kpf.find_path([5, 3]).value
# p kpf.trace_non_rec(kpf.find_path([7, 7]))
# p kpf.trace_path_back(kpf.find_path([7, 7]))
# p kpf.considered_positions
# p kpf.considered_positions.length
# p kpf.possible_moves([0,0])
# p KnightPathFinder.valid_moves([3,7])
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



