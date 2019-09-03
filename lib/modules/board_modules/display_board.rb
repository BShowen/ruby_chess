module DisplayBoard
    def to_s
        @display_board = clone_object_board
        convert_each_square_to_string
        add_borders_and_numbers_to_board
    end
    private
    def clone_object_board
        Marshal.load(Marshal.dump(@object_board))
    end

    def convert_each_square_to_string
        @display_board.map! do |row|
            row.map! do |square|
                square.empty? ? " " : square.piece.character
            end
        end
    end

    def add_borders_and_numbers_to_board
        @display_board.map!.with_index do |row,index|
            "#{7 - index} | #{row.join(" | ")} | #{7 - index}\n  |---|---|---|---|---|---|---|---|\n"
        end
        top_row = "  |---|---|---|---|---|---|---|---|\n"
        bottom_row = ["    A   B   C   D   E   F   G   H   "]
        @display_board.unshift(top_row)
        @display_board << bottom_row

        @display_board.join
    end 
end