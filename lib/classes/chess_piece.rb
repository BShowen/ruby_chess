class ChessPiece 
    attr_reader :character, :color

    def initialize(character, color)
        @character = character
        @color = color
        @king = am_i_a_king?
    end

    def am_i_a_king?
        if @character == "\u2654" || @character == "\u265A"
            true
        else
            false
        end
    end 

    def is_king?
        @king
    end

    def to_json
        JSON.dump({
            :character => @character, 
            :color => @color
        })
    end
end