require_relative "node"
require_relative "call_stack"
require "./lib/modules/board_modules/display_board.rb"
require "./lib/modules/board_modules/board_constraints.rb"
require "./lib/classes/chess_piece.rb"
require "./lib/modules/custom_error.rb"
require "colorize"

class Board
    include DisplayBoard
    include ChessBoardConstraints
    include Check

    attr_writer :current_turn_color

    def initialize
        @object_board = Array.new(8) {Array.new(8){Node.new} }
        @call_stack = CallStack.new
        @display_board = nil
        @current_turn_color = :white
        initialize_pieces
    end

    def select_piece(coords)
        @display_board = nil
        selected_square_cannot_be_blank(coords)
        selected_square_cannot_be_opponents_piece(coords)
        potential_moves = get_potential_moves(coords)
        raise HumanInputError.new("That piece has no legal moves. Try another piece") if potential_moves[:legal].empty?
        # show_moves("legal moves", potential_moves[:legal]) if potential_moves[:legal].empty? == false
        # show_moves("illegal moves", potential_moves[:illegal]) if potential_moves[:illegal].empty? == false
        set_colored_board(potential_moves)
    end

    def move(current_coords, desired_coords)
        if get_potential_moves(current_coords)[:legal].include?(desired_coords)
            make_move(current_coords, desired_coords)
            @display_board = nil
        else
            raise HumanInputError.new("That move is not legal")
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
        each_square do |column, row, sqr|
            next if sqr.empty? || sqr.piece.color == @current_turn_color || sqr.piece.is_king?
            get_moves_for_selected_piece([column, row]).each_value do |attack_path|
                next if attack_path.empty?
                return true if attack_path.include?(king)
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

    def each_square(&block)
        for row in 0..7 do 
            for column in 0..7 do 
                sqr = square([column, row])
                yield(column, row, sqr)
            end
        end
    end

    def make_move(starting_coords, ending_coords) 
        square(ending_coords).piece = square(starting_coords).piece
        square(starting_coords).piece = nil
    end

    def initialize_pieces
        black_character = ["\u265C", "\u265E", "\u265D", "\u265A", "\u265B", "\u265D", "\u265E", "\u265C"]
        white_character = ["\u2656", "\u2658", "\u2657", "\u2654", "\u2655", "\u2657", "\u2658", "\u2656"]
        for i in 0..7 do 
            square([ i ,7]).piece = ChessPiece.new(black_character[ i ],:black)
            square([ i ,0]).piece = ChessPiece.new(white_character[ i ],:white)
            square([ i ,6]).piece = ChessPiece.new("\u265F",:black)
            square([ i ,1]).piece = ChessPiece.new("\u2659",:white)
        end
    end
end