module KingMoves
    private
    def king_moves(current_coordinates, moves)
        current_color = square(current_coordinates).piece.color
        x = current_coordinates[0]
        y = current_coordinates[1]
        moves[:north] << [x, y + 1] if (y + 1 < 8) && constraints_are_met?([x, y + 1], current_color) 
        moves[:north_east] << [x + 1, y+ 1] if (x + 1 < 8 && y + 1 < 8) && constraints_are_met?([x + 1, y + 1], current_color) 
        moves[:east] << [x + 1, y] if (x + 1 < 8) && constraints_are_met?([x + 1, y], current_color) 
        moves[:south_east] << [x + 1, y - 1] if (x + 1 < 8 && y - 1 >= 0) && constraints_are_met?([x + 1, y - 1], current_color) 
        moves[:south] << [x, y - 1] if (y - 1 >= 0) && constraints_are_met?([x, y - 1], current_color)
        moves[:south_west] << [x - 1, y - 1] if (x - 1 >= 0 && y - 1 >= 0) && constraints_are_met?([x - 1, y - 1], current_color) 
        moves[:west] << [x - 1, y] if (x - 1 >= 0) && constraints_are_met?([x - 1, y], current_color) 
        moves[:north_west] << [x - 1, y + 1] if (x - 1 >= 0 && y + 1 < 8) && constraints_are_met?([x - 1, y + 1], current_color) 
        moves
    end
end