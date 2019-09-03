module KnightMoves
    private
    def knight_moves(current_coordinates, moves)
        current_color = square(current_coordinates).piece.color
        x = current_coordinates[0]
        y = current_coordinates[1]
        moves[:north_east] << [x + 2,y + 1] if (x + 2 < 8 && y + 1 < 8) &&  constraints_are_met?([x + 2, y + 1], current_color) 
        moves[:north_east] << [x + 1,y + 2] if (y + 2 < 8 && x + 1 < 8) && constraints_are_met?([x + 1, y + 2], current_color)  
        moves[:south_east] << [x + 1,y - 2] if (y - 2 >= 0 && x + 1 < 8) && constraints_are_met?([x + 1, y - 2], current_color)
        moves[:south_east] << [x + 2,y - 1] if (x + 2 < 8 && y - 1 >= 0) && constraints_are_met?([x + 2, y - 1], current_color)
        moves[:south_west] << [x - 2,y - 1] if (x - 2 >= 0 && y - 1 >= 0) && constraints_are_met?([x - 2, y - 1], current_color)
        moves[:south_west] << [x - 1,y - 2] if (y - 2 >= 0 && x - 1 >= 0) && constraints_are_met?([x - 1, y - 2], current_color)
        moves[:north_west] << [x - 1,y + 2] if (y + 2 < 8 && x - 1 >= 0) && constraints_are_met?([x - 1, y + 2], current_color)
        moves[:north_west] << [x - 2,y + 1] if (x - 2 >= 0 && y + 1 < 8)  && constraints_are_met?([x - 2, y + 1], current_color)
        moves   
    end
end