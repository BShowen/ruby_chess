module PawnMoves
    private
    def pawn_moves(current_coordinates, moves)
        # @current_turn_color == :white ? white_pawn_moves(current_coordinates) : black_pawn_moves(current_coordinates)
        current_color = square(current_coordinates).piece.color
        current_color == :white ? white_pawn_moves(current_coordinates, current_color, moves) : 
        black_pawn_moves(current_coordinates, current_color, moves)

    end
    
    def white_pawn_moves(current_coordinates, current_color, moves)
        x = current_coordinates[0]
        y = current_coordinates[1]
        current_color = :white
        moves[:north] << [x, y + 1] if (y + 1 < 8) && square_ahead_is_empty?([x, y + 1]) 
        moves[:north] << [x, y + 2] if (y == 1) && square_ahead_is_empty?([x, y + 1]) && square_ahead_is_empty?([x, y + 2])
        moves[:north_east] << [x + 1, y + 1] if (x + 1 < 8 && y + 1 < 8) && capture_constraints_are_met?([x + 1, y + 1], current_color)
        moves[:north_west] << [x - 1, y + 1] if (x - 1 >= 0 && y + 1 < 8) && capture_constraints_are_met?([x - 1, y + 1], current_color)
        moves
    end

    def black_pawn_moves(current_coordinates, current_color, moves)
        x = current_coordinates[0]
        y = current_coordinates[1]
        current_color = :black
        moves[:south] << [x, y - 1] if (y - 1 >= 0) && square_ahead_is_empty?([x, y - 1]) 
        moves[:south] << [x, y - 2] if (y == 6) && square_ahead_is_empty?([x, y - 1]) && square_ahead_is_empty?([x, y - 2])
        moves[:south_east] << [x + 1, y - 1] if (x + 1 < 8 && y - 1 >= 0) && capture_constraints_are_met?([x + 1, y - 1], current_color)
        moves[:south_west] << [x - 1, y - 1] if (x - 1 >= 0 && y - 1 >= 0) && capture_constraints_are_met?([x - 1, y - 1], current_color)
        moves
    end

    def capture_constraints_are_met?(coords, current_color)
        # square(coords).empty? == false && square_is_opponents_piece?(coords)
        square(coords).empty? == false && square_is_opponents_piece?(coords, current_color)
    end

    def square_is_opponents_piece?(coords, current_color)
        # square(coords).piece.color != @current_turn_color
        square(coords).piece.color != current_color
    end

    def square_ahead_is_empty?(coords)
        square(coords).empty? == true
    end
end