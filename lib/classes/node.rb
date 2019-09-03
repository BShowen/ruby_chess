class Node
    attr_accessor :piece, :background

    def initialize 
        @piece = nil
        @background = nil
    end

    def empty?
        @piece == nil
    end
end