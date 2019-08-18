module SetupBoard
    private
    def set_black_pieces
        square([0,7]).piece = Rook.new("r",:black, [0,7])
        square([1,7]).piece = Knight.new("k",:black, [1,7])
        square([2,7]).piece = Bishop.new("b",:black, [2,7])
        square([3,7]).piece = King.new("K",:black, [3,7])
        square([4,7]).piece = Queen.new("q",:black, [4,7])
        square([5,7]).piece = Bishop.new("b",:black, [5,7])
        square([6,7]).piece = Knight.new("k",:black, [6,7])
        square([7,7]).piece = Rook.new("r",:black, [7,7])
        for column in 0..7 do 
            square([column,6]).piece = Pawn.new("p",:black,[column,6])
        end
    end

    def set_white_pieces
        square([0,0]).piece = Rook.new("r",:white, [0,0])
        square([1,0]).piece = Knight.new("k",:white, [1,0])
        square([2,0]).piece = Bishop.new("b",:white, [2,0])
        square([3,0]).piece = King.new("K",:white, [3,0])
        square([4,0]).piece = Queen.new("q",:white, [4,0])
        square([5,0]).piece = Bishop.new("b",:white, [5,0])
        square([6,0]).piece = Knight.new("k",:white, [6,0])
        square([7,0]).piece = Rook.new("r",:white, [7,0])
        for column in 0..7 do 
            square([column,1]).piece = Pawn.new("p",:white,[column,1])
        end
    end
end 