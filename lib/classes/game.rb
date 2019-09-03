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

    def pickup_piece
        begin
            puts "#{turn.capitalize}, Choose a piece to move"
            selected_piece = solicit_move
            clear_screen
            display_board
            $board.select_piece(selected_piece)
        rescue StandardError => e
            # puts "entered rescue in pickup_piece"
            puts e.message
            # puts e.backtrace
            retry
        end
        selected_piece
    end
    
    def set_piece_down(starting_coords)
        begin
            puts "Choose where to set it down"
            to_here = solicit_move
            $board.move(starting_coords, to_here)
            clear_screen
            display_board
        rescue StandardError => e
            # puts "eneterd rescue in set_piece_down"
            puts e.message 
            # puts e.backtrace
            retry
        end
    end
    
    def clear_screen
        puts `clear`
    end
    
    def display_board
        puts $board
    end
end