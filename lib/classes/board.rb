require_relative "node"
require_relative "call_stack"
require "./lib/modules/board_modules/setup_board.rb"
require "./lib/modules/board_modules/display_board.rb"
require "./lib/modules/board_modules/board_constraints.rb"
require "./lib/classes/chess_piece.rb"
require "./lib/modules/custom_error.rb"

class Board
    include SetupBoard
    include DisplayBoard
    include ChessBoardConstraints
    include Check

    attr_writer :current_turn_color

    def initialize
        @object_board = Array.new(8) {Array.new(8){Node.new} }
        @call_stack = CallStack.new
        @display_board = nil
        @current_turn_color = :white
        set_black_pieces
        set_white_pieces
    end

    def select_piece(coords)
        selected_square_cannot_be_blank(coords)
        selected_square_cannot_be_opponents_piece(coords)
        potential_moves = get_potential_moves(coords)
        raise HumanInputError.new("no moves") if potential_moves[:legal].empty?
        show_moves("legal moves", potential_moves[:legal]) if potential_moves[:legal].empty? == false
        show_moves("illegal moves", potential_moves[:illegal]) if potential_moves[:illegal].empty? == false
        potential_moves
    end

    def move(current_coords, desired_coords)
        if get_potential_moves(current_coords)[:legal].include?(desired_coords)
            make_move(current_coords, desired_coords)
        else
            raise HumanInputError.new("illegal") 
        end
    end

    def check_mate?
        king = find_king_coords
        if get_potential_moves(king)[:legal].empty? == true && in_check? == true && can_teammates_help?(king) == false
            true
        else
            false
        end
    end

    def in_check?
        king = find_king_coords
        for row in 0..7 do 
            for column in 0..7 do 
                next if square([column, row]).empty? || square([column, row]).piece.color == @current_turn_color || square([column, row]).piece.character == "K"
                get_moves_for_selected_piece([column, row]).each do |row, coords|
                    next if coords.empty?
                    coords.each do 
                        return true if coords.include?(king)
                    end
                end
            end
        end
        false
    end

    private
    def show_moves(message, arr) #this method will be removed once I learn how to colorize the chess board. 
        str = ""
        converter = { "a" => 0, "b" => 1, "c" => 2, "d" => 3, "e" => 4, "f" => 5, "g" => 6, "h" => 7}
        arr.each do |coord|
            x = converter.key(coord[0]).upcase
            str += "(#{x},#{coord[1]}) "
        end
        puts "#{message}: #{str}"
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