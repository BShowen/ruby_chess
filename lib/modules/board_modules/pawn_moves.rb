module PawnMoves
    private
    def pawn_moves(current_coordinates)
        @current_turn_color == :white ? white_pawn_moves(current_coordinates) : black_pawn_moves(current_coordinates)
    end
    
    def white_pawn_moves(current_coordinates)
        x = current_coordinates[0]
        y = current_coordinates[1]
        current_color = :white
        move_list = []
        move_list << [x, y + 1] if (y + 1 < 8) && square_ahead_is_empty?([x, y + 1]) 
        move_list << [x, y + 2] if (y == 1) && square_ahead_is_empty?([x, y + 1]) && square_ahead_is_empty?([x, y + 2])
        move_list << [x + 1, y + 1] if (x + 1 < 8 && y + 1 < 8) && capture_constraints_are_met?([x + 1, y + 1])
        move_list << [x - 1, y + 1] if (x - 1 >= 0 && y + 1 < 8) && capture_constraints_are_met?([x - 1, y + 1])
        move_list
    end

    def black_pawn_moves(current_coordinates)
        x = current_coordinates[0]
        y = current_coordinates[1]
        current_color = :black
        move_list = []
        move_list << [x, y - 1] if (y - 1 >= 0) && square_ahead_is_empty?([x, y - 1]) 
        move_list << [x, y - 2] if (y == 6) && square_ahead_is_empty?([x, y - 1]) && square_ahead_is_empty?([x, y - 2])
        move_list << [x + 1, y - 1] if (x + 1 < 8 && y - 1 >= 0) && capture_constraints_are_met?([x + 1, y - 1])
        move_list << [x - 1, y - 1] if (x - 1 >= 0 && y - 1 >= 0) && capture_constraints_are_met?([x - 1, y - 1])
        move_list
    end

    def capture_constraints_are_met?(coords)
        square(coords).empty? == false && square_is_opponents_piece?(coords)
    end

    def square_is_opponents_piece?(coords)
        square(coords).piece.color != @current_turn_color
    end

    def square_ahead_is_empty?(coords)
        square(coords).empty? == true
    end
end