require "./lib/classes/board"
require "./lib/classes/player"
require "./lib/classes/game"


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
        $game.set_piece_down($game.pickup_piece)
        $board.current_turn_color = $game.toggle_turn
        break if $board.check_mate?
        puts "#{$game.turn}, you are in check." if $board.in_check?
    end
    puts "#{$game.toggle_turn.capitalize} wins!"
end

play_game