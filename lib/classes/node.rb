class Node
    attr_accessor :piece, :background

    def initialize 
        @piece = nil
        @background = nil
    end

    def empty?
        @piece == nil
    end

    def to_json
        JSON.dump({
            :piece => @piece.to_json, 
            :background => @background
        })
    end
end