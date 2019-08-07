module PawnHelpers
    def move_pawn(current_pos, desired_pos)
        @chess_board.square(desired_pos).piece = @chess_board.square(current_pos).piece
        @chess_board.square(current_pos).piece = nil
        @pawn = @chess_board.square(desired_pos).piece
        @pawn.current_position = desired_pos
    end

    def move_knight_in_front_of_pawn
        @chess_board.square([2,2]).piece = @chess_board.square([1,0]).piece
        @chess_board.square([1,0]).piece = nil

        @chess_board.square([2,5]).piece = @chess_board.square([1,7]).piece
        @chess_board.square([1,7]).piece = nil
    end
end