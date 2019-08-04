require_relative "node"
require_relative "bishop"
require_relative "knight"
require_relative "king"
require_relative "queen"
require_relative "pawn"
require_relative "rook"

class ChessBoard

    attr_accessor :object_board

    def initialize 
        @object_board = Array.new(8) {Array.new(8){Node.new} }
        set_game_pieces
        @display_board = nil
    end

    def display
        clone_object_board
        convert_each_square_to_string
        add_borders_and_columns_to_board
    end

    def square(column,row)
        @object_board[8 - row][column - 1]
    end

    private 
    def set_game_pieces
        square(1,8).piece = Rook.new
        square(2,8).piece = Knight.new
        square(3,8).piece = Bishop.new
        square(4,8).piece = King.new
        square(5,8).piece = Queen.new
        square(6,8).piece = Bishop.new
        square(7,8).piece = Knight.new
        square(8,8).piece = Rook.new
        for column in 1..8 do 
            square(column,7).piece = Pawn.new
        end

        square(1,1).piece = Rook.new
        square(2,1).piece = Knight.new
        square(3,1).piece = Bishop.new
        square(4,1).piece = King.new
        square(5,1).piece = Queen.new
        square(6,1).piece = Bishop.new
        square(7,1).piece = Knight.new
        square(8,1).piece = Rook.new
        for column in 1..8 do 
            square(column,2).piece = Pawn.new
        end

    end

    def clone_object_board
        @display_board = Marshal.load(Marshal.dump(@object_board))
    end

    def convert_each_square_to_string
        @display_board.map! do |row|
            row.map! do |square|
                square.empty? ? " " : square.piece.character
            end
        end
    end

    def add_borders_and_columns_to_board
        @display_board.map!.with_index(1) do |row,index|
            "#{9 - index} | #{row.join(" | ")} |\n"
        end
        bottom_row = ["  |---|---|---|---|---|---|---|---|\n    A   B   C   D   E   F   G   H   "]
        @display_board << bottom_row
        @display_board.join
    end 
end