require "./lib/classes/board"
require "./lib/classes/player"
require "./lib/classes/game"

def pickup_piece
    begin
        puts "#{$game.turn.capitalize}, Choose a piece to move"
        $selected_piece = $game.solicit_move
        clear_screen
        display_board
        $board.select_piece($selected_piece, $game.turn)
    rescue StandardError => e
        puts "entered rescue in main"
        puts e.message
        # puts e.backtrace
        retry
    end
end

def set_piece_down
    begin
        puts "Choose where to set it down"
        to_here = $game.solicit_move
        $board.move($selected_piece, to_here)
        $game.toggle_turn
        clear_screen
        display_board
    rescue StandardError => e
        puts e.message 
        retry
    end
end

def clear_screen
    puts `clear`
end

def display_board
    puts $board.to_s
end

def play_game
    $game = Game.new
    $board = Board.new
    player_1 = Player.new(:white)
    player_2 = Player.new(:black)

    clear_screen
    display_board
    loop do
        pickup_piece
        set_piece_down
    end
end

play_game