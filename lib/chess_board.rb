class ChessBoard
    def initialize 
        @board = Array.new(8) {Array.new(8) }
    end

    def display
        @new_board = Marshal.load(Marshal.dump(@board))
        @new_board.map! do |row|
            row.map! do |nan|
                " "
            end
        end
        @new_board.map!.with_index(1) do |row,index|
            "#{index} | #{row.join(" | ")} |\n"
        end
        @new_board << ["  |---|---|---|---|---|---|---|---|\n    A   B   C   D   E   F   G   H   "]
        @new_board.join
    end
end