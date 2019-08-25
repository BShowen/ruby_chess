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

    def solicit_move
        begin
            reply = gets.chomp[0..1]
            ensure_reply_was_given(reply)
            x_coordinate = validate_x_coordinate(reply[0])
            y_coordinate = validate_y_coordinate(reply[1])
        rescue StandardError => e
            puts e.message
            retry 
        end
        [x_coordinate,y_coordinate]
    end

    def go
        reply = gets.chomp
        puts reply
    end
end