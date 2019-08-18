class Node
    attr_accessor :piece

    def initialize 
        @piece = nil
    end

    def empty?
        @piece == nil
    end
end