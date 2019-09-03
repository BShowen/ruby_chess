module SetupBoard
    private
    def set_black_pieces
        character = ["r", "k", "b", "K", "q", "b", "k", "r"]
        for i in 0..7 do 
            square([ i ,7]).piece = ChessPiece.new(character[ i ],:black)
        end
        for i in 0..7 do 
            square([ i ,6]).piece = ChessPiece.new("p",:black)
        end
    end

    def set_white_pieces
        character = ["r", "k", "b", "K", "q", "b", "k", "r"]
        for i in 0..7 do 
            square([ i ,0]).piece = ChessPiece.new(character[ i ],:white)
        end
        for i in 0..7 do 
            square([ i ,1]).piece = ChessPiece.new("p",:white)
        end
    end
end 