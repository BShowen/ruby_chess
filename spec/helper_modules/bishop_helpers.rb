module BishopHelpers
    def move_pawn(current_coords, desired_coords)
        @chess_board.square(desired_coords).piece = @chess_board.square(current_coords).piece
        @chess_board.square(current_coords).piece = nil
    end

    def place_bishop_on_row(row)
        @chess_board.square([2,row]).piece = @chess_board.square([2,0]).piece
        @chess_board.square([2,row]).piece.current_position = [2,row]
        @chess_board.square([2,0]).piece = nil
    end
end