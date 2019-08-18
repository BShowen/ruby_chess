require_relative "node"
require "./lib/modules/board_modules/setup_board.rb"
require "./lib/modules/board_modules/display_the_board.rb"
require "./lib/modules/board_modules/board_constraints.rb"
require "./lib/classes/chess_pieces.rb"

class Board
    include SetupBoard
    include DisplayTheBoard
    include ChessBoardConstraints
    # attr_accessor :object_board

    def initialize
        @object_board = Array.new(8) {Array.new(8){Node.new} }
        set_black_pieces
        set_white_pieces
        @display_board = nil
        @current_turn_color = nil
    end

    def to_s
        clone_object_board
        convert_each_square_to_string
        add_borders_and_columns_to_board
    end

    def select_piece(coords, whos_turn)
        @current_turn_color = whos_turn
        selected_square_cannot_be_blank(coords)
        selected_square_cannot_be_opponents_piece(coords)
        puts "Your legal moves are: #{show_moves(get_moves_for_selected_piece(coords))}"
    end

    def move(current_coords, desired_coords)
        if get_moves_for_selected_piece(current_coords).include? desired_coords
            make_move(current_coords, desired_coords)
        else
            raise HumanInputError.new("illegal") 
        end
    end

    private
    def show_moves(arr)
        str = ""
        converter = { "a" => 0, "b" => 1, "c" => 2, "d" => 3, "e" => 4, "f" => 5, "g" => 6, "h" => 7}
        arr.each do |coord|
            x = converter.key(coord[0]).upcase
            str += "(#{x},#{coord[1]}) "
        end
        str
    end

    def square(coordinates)
        row = coordinates[1]
        column = coordinates[0]
        @object_board[7 - row][column]
    end

    def make_move(starting_coords, ending_coords) 
        square(ending_coords).piece = square(starting_coords).piece
        square(starting_coords).piece = nil
    end
end