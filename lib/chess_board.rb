require_relative "node"
require_relative "bishop"
require_relative "knight"
require_relative "king"
require_relative "queen"
require_relative "pawn"
require_relative "rook"
require_relative "custom_enumerable"

class ChessBoard

    include CustomEnumerable
    attr_accessor :object_board

    def initialize 
        $object_board = Array.new(8) {Array.new(8){Node.new} }
        set_game_pieces
        @display_board = nil
    end

    def display
        clone_object_board
        convert_each_square_to_string
        add_borders_and_columns_to_board
    end

    private 
    def set_game_pieces
        square([0,7]).piece = Rook.new("r","white", [0,7])
        square([1,7]).piece = Knight.new("k","white", [1,7])
        square([2,7]).piece = Bishop.new("b","white", [2,7])
        square([3,7]).piece = King.new("K","white", [3,7])
        square([4,7]).piece = Queen.new("q","white", [4,7])
        square([5,7]).piece = Bishop.new("b","white", [5,7])
        square([6,7]).piece = Knight.new("k","white", [6,7])
        square([7,7]).piece = Rook.new("r","white", [7,7])
        for column in 0..7 do 
            square([column,6]).piece = Pawn.new("p","white")
        end

        square([0,0]).piece = Rook.new("r","black")
        square([1,0]).piece = Knight.new("k","black")
        square([2,0]).piece = Bishop.new("b","black")
        square([3,0]).piece = King.new("K","black")
        square([4,0]).piece = Queen.new("q","black")
        square([5,0]).piece = Bishop.new("b","black")
        square([6,0]).piece = Knight.new("k","black")
        square([7,0]).piece = Rook.new("r","black")
        for column in 0..7 do 
            square([column,1]).piece = Pawn.new("p","black")
        end

    end

    def clone_object_board
        @display_board = Marshal.load(Marshal.dump($object_board))
    end

    def convert_each_square_to_string
        @display_board.map! do |row|
            row.map! do |square|
                square.empty? ? " " : square.piece.character
            end
        end
    end

    def add_borders_and_columns_to_board
        @display_board.map!.with_index do |row,index|
            "#{7 - index} | #{row.join(" | ")} |\n"
        end
        bottom_row = ["  |---|---|---|---|---|---|---|---|\n    0   1   2   3   4   5   6   7   "]
        @display_board << bottom_row
        @display_board.join
    end 
end