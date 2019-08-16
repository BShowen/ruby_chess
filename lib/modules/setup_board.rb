module SetupBoard
    private
    def set_black_pieces
        square([0,7]).piece = Rook.new("r","black", [0,7])
        square([1,7]).piece = Knight.new("k","black", [1,7])
        square([2,7]).piece = Bishop.new("b","black", [2,7])
        square([3,7]).piece = King.new("K","black", [3,7])
        square([4,7]).piece = Queen.new("q","black", [4,7])
        square([5,7]).piece = Bishop.new("b","black", [5,7])
        square([6,7]).piece = Knight.new("k","black", [6,7])
        square([7,7]).piece = Rook.new("r","black", [7,7])
        for column in 0..7 do 
            square([column,6]).piece = Pawn.new("p","black",[column,6])
        end
    end

    def set_white_pieces
        square([0,0]).piece = Rook.new("r","white", [0,0])
        square([1,0]).piece = Knight.new("k","white", [1,0])
        square([2,0]).piece = Bishop.new("b","white", [2,0])
        square([3,0]).piece = King.new("K","white", [3,0])
        square([4,0]).piece = Queen.new("q","white", [4,0])
        square([5,0]).piece = Bishop.new("b","white", [5,0])
        square([6,0]).piece = Knight.new("k","white", [6,0])
        square([7,0]).piece = Rook.new("r","white", [7,0])
        for column in 0..7 do 
            square([column,1]).piece = Pawn.new("p","white",[column,1])
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
        bottom_row = ["  |---|---|---|---|---|---|---|---|\n    A   B   C   D   E   F   G   H   "]
        @display_board << bottom_row
        @display_board.join
    end 
end 