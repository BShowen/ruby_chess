module SetupBoard
    private
    def set_black_pieces
        character = ["\u265C", "\u265E", "\u265D", "\u265A", "\u265B", "\u265D", "\u265E", "\u265C"]
        for i in 0..7 do 
            square([ i ,7]).piece = ChessPiece.new(character[ i ],:black)
        end
        for i in 0..7 do 
            square([ i ,6]).piece = ChessPiece.new("\u265F",:black)
        end
    end

    def set_white_pieces
        character = ["\u2656", "\u2658", "\u2657", "\u2654", "\u2655", "\u2657", "\u2658", "\u2656"]
        for i in 0..7 do 
            square([ i ,0]).piece = ChessPiece.new(character[ i ],:white)
        end
        for i in 0..7 do 
            square([ i ,1]).piece = ChessPiece.new("\u2659",:white)
        end
    end
end 