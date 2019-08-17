require_relative "node"
require "./lib/modules/setup_board.rb"
require "./lib/modules/chess_board_constraints.rb"

Dir["./lib/chess_piece_classes/*.rb"].each do |file| 
    require file unless file == "./lib/chess_piece_classes/basic_chess_piece.rb"
end

class ChessBoard
    include SetupBoard
    include ChessBoardConstraints
    attr_accessor :object_board, :turn

    def initialize
        $object_board = Array.new(8) {Array.new(8){Node.new} }
        set_black_pieces
        set_white_pieces
        @display_board = nil
        @turn = "white"
    end

    def square(coordinates)
        row = coordinates[1]
        column = coordinates[0]
        $object_board[7 - row][column]
    end

    def to_s
        clone_object_board
        convert_each_square_to_string
        add_borders_and_columns_to_board
    end

    def move_piece(from_here, to_here)
        begin
            selected_square_cannot_be_blank(from_here)
            selected_square_cannot_be_opponents_piece(from_here)
        rescue  HumanInputError => e
            puts e.message
            false
        else
            make_move(from_here, to_here)
            toggle_turn
        end
    end

    private
    def selected_square_cannot_be_blank(from_here)
        raise HumanInputError, "That square is empty. Select a playing piece" if  square(from_here).empty?
    end

    def selected_square_cannot_be_opponents_piece(from_here)
        raise HumanInputError, "You cannot select opponents pieces" if square(from_here).piece.color != @turn 
    end

    def make_move(from_here, to_here)
        square(to_here).piece = square(from_here).piece
        square(from_here).piece = nil
    end


    def toggle_turn
        @turn == "white" ? @turn = "black" : @turn = "white"
    end
end