require "bundler/inline"
gemfile do 
    source 'https://rubygems.org'
    gem 'colorize'
end
require "./lib/modules/game_modules/solicit_player_moves.rb"
require "./lib/classes/board"
require "./lib/classes/player"
require "./lib/classes/game"


def clear_screen_display_board
    puts `clear`
    puts $board
end

def play_game
    $board = Board.new
    player_1 = Player.new(:white)
    player_2 = Player.new(:black)
    puts `clear`
    puts "Welcome to chess.\n".center(120)
    puts "Enter 1 to play a new game or enter 2 to load a game"
    reply = gets.chomp
    if reply == "1"
        new_game
    else
        #load_game
    end
end

def solicit_move
    begin
        reply = gets.chomp[0..1]
        SolicitPlayerMoves::ensure_reply_was_given(reply)
        x_coordinate = SolicitPlayerMoves::validate_x_coordinate(reply[0])
        y_coordinate = SolicitPlayerMoves::validate_y_coordinate(reply[1])
    rescue StandardError => e
        # puts "solicit move"
        # puts e.backtrace
        clear_screen_display_board
        puts e.message
        retry 
    end
    [x_coordinate,y_coordinate]
end

def new_game
    loop do
        clear_screen_display_board
        puts "#{$board.current_turn_color}, choose a piece to move. "
        begin
            $delta_1 = solicit_move
            save_game if $delta_1 == "save"
            $board.select_piece($delta_1)
        rescue => e
            # puts e.backtrace
            clear_screen_display_board
            puts e.message
            retry
        end
        clear_screen_display_board

        puts "Choose where to set it down"
        begin
            $delta_2 = solicit_move
            $board.move($delta_1, $delta_2)
        rescue => e
            # puts e.backtrace
            clear_screen_display_board
            puts e.message
            retry
        end

        break if $board.check_mate?
        puts "#{$board.current_turn_color}, you are in check." if $board.in_check?
    end
    clear_screen_display_board
    puts "#{$board.toggle_turn.capitalize} wins!"
end

play_game