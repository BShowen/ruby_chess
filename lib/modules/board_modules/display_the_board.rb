module DisplayTheBoard
    private
    def clone_object_board
        Marshal.load(Marshal.dump(@object_board))
    end

    def convert_each_square_to_string
        @temp_board.map! do |row|
            row.map! do |square|
                square.empty? ? " " : square.piece.character
            end
        end
    end

    def add_borders_and_columns_to_board
        @temp_board.map!.with_index do |row,index|
            "#{7 - index} | #{row.join(" | ")} | #{7 - index}\n"
        end
        bottom_row = ["  |---|---|---|---|---|---|---|---|\n    A   B   C   D   E   F   G   H   "]
        @temp_board << bottom_row
        @temp_board.join
    end 
end