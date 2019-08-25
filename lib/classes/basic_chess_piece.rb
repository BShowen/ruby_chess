class BasicChessPiece 
    attr_reader :character, :color

    def initialize(character, color, current_position)
        @character = character
        @color = color
    end
end