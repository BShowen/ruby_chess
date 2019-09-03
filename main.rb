require "./lib/classes/board"
require "./lib/classes/player"
require "./lib/classes/game"

def pickup_piece
    begin
        puts "#{$game.turn.capitalize}, Choose a piece to move"
        selected_piece = $game.solicit_move
        clear_screen
        display_board
        $board.select_piece(selected_piece)
    rescue StandardError => e
        puts "entered rescue in pickup_piece"
        puts e.message
        puts e.backtrace
        retry
    end
    selected_piece
end

def set_piece_down(starting_coords)
    begin
        puts "Choose where to set it down"
        to_here = $game.solicit_move
        $board.move(starting_coords, to_here)
        clear_screen
        display_board
    rescue StandardError => e
        puts "eneterd rescue in set_piece_down"
        puts e.message 
        puts e.backtrace
        retry
    end
end

def clear_screen
    puts `clear`
end

def display_board
    puts $board
end

def play_game
    $game = Game.new
    $board = Board.new
    player_1 = Player.new(:white)
    player_2 = Player.new(:black)

    clear_screen
    display_board
    loop do
        set_piece_down(pickup_piece)
        $board.current_turn_color = $game.toggle_turn
        break if $board.check_mate?
        puts "#{$game.turn}, you are in check." if $board.in_check?
    end
    puts "#{$game.toggle_turn.capitalize} wins!"
end

play_game