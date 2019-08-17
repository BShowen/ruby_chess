require "./lib/modules/solicit_player_moves.rb"

class Player
    include SolicitPlayerMoves
    attr_accessor  :name, :color

    def initialize(name, color)
        @name = name
        @color = color
    end
end