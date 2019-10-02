require "json"
require "colorize"
require "./lib/modules/board_modules/display_board.rb"
require "./lib/modules/board_modules/board_constraints.rb"
require "./lib/modules/board_modules/move_validation.rb"
require "./lib/modules/custom_error.rb"
require "./lib/classes/chess_piece.rb"
require_relative "node"
require_relative "call_stack"

class Board
    include DisplayBoard
    include BoardConstraints
    include MoveValidation

    attr_accessor :current_turn_color

    def initialize
        @object_board = Array.new(8) {Array.new(8){Node.new} }
        @call_stack = CallStack.new
        @display_board = []
        @current_turn_color = :white
        initialize_pieces
    end

    def select_piece(coords)
        @display_board.clear
        selected_square_cannot_be_blank(coords)
        selected_square_cannot_be_opponents_piece(coords)
        legal_moves = sanitized_moves(coords)
        raise HumanInputError.new("That piece has no legal moves. Try another piece") if legal_moves[:good].empty?
        colorize_moves(legal_moves)
    end

    def move(current_coords, desired_coords)
        if sanitized_moves(current_coords)[:good].include?(desired_coords)
            make_move(current_coords, desired_coords)
            @display_board.clear
        else
            raise HumanInputError.new("That move is not legal")
        end
    end

    def check_mate?
        king = find_king_coords
        if sanitized_moves(king)[:good].empty? == true && in_check? == true && can_teammates_help?(king) == false
            true
        else
            false
        end
    end

    def in_check?
        king = find_king_coords
        each_square do |column, row, sqr|
            next if sqr.empty? || sqr.piece.color == @current_turn_color || sqr.piece.is_king?
            potential_moves([column, row]).each_value do |attack_path|
                next if attack_path.empty?
                return true if attack_path.include?(king)
            end
        end
        false
    end

    def toggle_turn
        @current_turn_color == :white ? @current_turn_color = :black : @current_turn_color = :white
    end
    
    def to_s
        if @display_board.empty?
            @display_board = clone_object_board
            convert_each_square_to_string
            add_borders_and_numbers_to_board
        else
            @display_board.join
        end
    end

    private
    def square(coordinates)
        row = coordinates[1]
        column = coordinates[0]
        @object_board[7 - row][column]
    end

    def each_square
        for row in 0..7 
            for column in 0..7 do 
                sqr = square([column, row])
                yield(column, row, sqr)
            end
        end
    end

    def make_move(starting_coords, ending_coords) 
        square(ending_coords).piece = square(starting_coords).piece
        square(starting_coords).piece = nil
        toggle_turn
    end

    def initialize_pieces #   rook          knight       bishop       king         queen        bishop      knight     rook
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