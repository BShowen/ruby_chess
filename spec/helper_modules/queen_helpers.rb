module QueenHelpers
    def move_pawn_out_of_the_queens_way
        @chess_board.square([4,3]).piece = @chess_board.square([4,1]).piece
        @chess_board.square([4,1]).piece = nil
    end

    def place_queen_on_row(row)
        @chess_board.square([4,row]).piece = @chess_board.square([4,0]).piece
        @queen.current_position = [4,row]
        @chess_board.square([4,0]).piece = nil
    end
end