require "./lib/modules/game_modules/solicit_player_moves.rb"

class Game
    include SolicitPlayerMoves
    attr_reader :turn

    def initialize 
        @turn = :white
    end

    def toggle_turn
        @turn == :white ? @turn = :black : @turn = :white
    end
end