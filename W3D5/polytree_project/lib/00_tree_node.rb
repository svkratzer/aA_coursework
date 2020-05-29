class PolyTreeNode
    attr_reader :children, :value


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
        @parent = node
        node.children << self
    end
    

end