module KingHelpers
    def move_pawn_out_of_the_kings_way
        @chess_board.square([3,3]).piece = @chess_board.square([3,1]).piece
        @chess_board.square([3,1]).piece = nil
    end

    def place_king_on_row(row)
        @chess_board.square([3,row]).piece = @chess_board.square([3,0]).piece
        @king.current_position = [3,row]
        @chess_board.square([3,0]).piece = nil
    end
end