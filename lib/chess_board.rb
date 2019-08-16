require_relative "node"
require "./lib/modules/setup_board.rb"
require "./lib/modules/solicit_player_moves.rb"

Dir["./lib/chess_piece_classes/*.rb"].each do |file| 
    require file unless file == "./lib/chess_piece_classes/basic_chess_piece.rb"
end

class ChessBoard
    include SetupBoard
    include SolicitPlayerMoves
    attr_accessor :object_board

    def initialize
        $object_board = Array.new(8) {Array.new(8){Node.new} }
        set_black_pieces
        set_white_pieces
        @display_board = nil
        @turn = "white"
    end

    def to_s
        clone_object_board
        convert_each_square_to_string
        add_borders_and_columns_to_board
    end

    def square(coordinates)
        row = coordinates[1]
        column = coordinates[0]
        $object_board[7 - row][column]
    end
end