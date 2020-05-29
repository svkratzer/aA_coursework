class PolyTreeNode
    attr_reader :children, :value, :parent

    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    def parent=(node)
        if node == nil
            @parent = nil
            return
        end
        self.parent.children.delete(self) unless @parent.nil?
        @parent = node
        node.children << self if !node.children.include?(self)

    end

    def add_child(child_node)
      child_node.parent = self
    end

    def remove_child(child_node)
      if @children.include?(child_node)
        child_node.parent = nil
      else
        raise "CHILD NOT FOUND"
      end
    end

    def dfs(target)
      return self if self.value == target 
      return nil if self.value.nil?
      @children.each do |child|
        result = child.dfs(target)
        return result unless result.nil?
      end
      nil
    end

    def bfs(target)
      queue = [self]
      until queue.empty?
        curr_node = queue.shift
        return curr_node if curr_node.value == target
        queue += curr_node.children
      end
      nil
    end

end

