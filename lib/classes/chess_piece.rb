class ChessPiece 
    attr_reader :character, :color

    def initialize(character, color)
        @character = character
        @color = color
    end
end