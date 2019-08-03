require_relative "node"

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

    end


    def clone_object_board
        @display_board = Marshal.load(Marshal.dump(@object_board))
    end

    def convert_each_square_to_string
        @display_board.map! do |row|
            row.map! do |square|
                square.empty? ? " " : square.character
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