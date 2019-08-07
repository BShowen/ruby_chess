module Helpers
    def move_pawn(current_pos, desired_pos)
        @chess_board.square(desired_pos).piece = @chess_board.square(current_pos).piece
        @chess_board.square(current_pos).piece = nil
        @chess_board.square(desired_pos).piece.current_position = desired_pos
    end 

    def move_knight_in_front_of_pawn
        @chess_board.square([2,2]).piece = @chess_board.square([1,0]).piece
        @chess_board.square([1,0]).piece = nil

        @chess_board.square([2,5]).piece = @chess_board.square([1,7]).piece
        @chess_board.square([1,7]).piece = nil
    end

    def place_piece_on_square(piece, coords)
        x = coords[0]
        y = coords[1]
        @chess_board.square([x,y]).piece = @chess_board.square(piece.current_position).piece
        @chess_board.square(piece.current_position).piece = nil
        piece.current_position = coords
    end
end