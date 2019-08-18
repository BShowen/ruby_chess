module KnightMoves
    private
    def knight_moves(current_coordinates)
        x = current_coordinates[0]
        y = current_coordinates[1]
        moves = []
        moves << [x - 2,y - 1] if (x - 2 >= 0 && y - 1 >= 0) && constraints_are_met?([x - 2, y - 1])
        moves << [x - 2,y + 1] if (x - 2 >= 0 && y + 1 < 8)  && constraints_are_met?([x - 2, y + 1])
        moves << [x + 2,y - 1] if (x + 2 < 8 && y - 1 >= 0) && constraints_are_met?([x + 2, y - 1])
        moves << [x + 2,y + 1] if (x + 2 < 8 && y + 1 < 8) &&  constraints_are_met?([x + 2, y + 1]) 
        moves << [x - 1,y - 2] if (y - 2 >= 0 && x - 1 >= 0) && constraints_are_met?([x - 1, y - 2])
        moves << [x + 1,y - 2] if (y - 2 >= 0 && x + 1 < 8) && constraints_are_met?([x + 1, y - 2])
        moves << [x - 1,y + 2] if (y + 2 < 8 && x - 1 >= 0) && constraints_are_met?([x - 1, y + 2])                 
        moves << [x + 1,y + 2] if (y + 2 < 8 && x + 1 < 8) && constraints_are_met?([x + 1, y + 2])  
        moves   
    end

end