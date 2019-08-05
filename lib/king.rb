require_relative "basic_chess_piece"

class King < BasicChessPiece

    def get_legal_moves(current_coordinates)
        x = current_coordinates[0]
        y = current_coordinates[1]
        adj_list = []
        adj_list << [x + 1, y] if (x + 1 < 8) && constraints_are_met?(x + 1, y)
        adj_list << [x - 1, y] if (x - 1 >= 0) && constraints_are_met?(x - 1, y)                 
        adj_list << [x, y + 1] if (y + 1 < 8) && constraints_are_met?(x, y + 1)
        adj_list << [x, y - 1] if (y - 1 >= 0) && constraints_are_met?(x, y - 1)                 
        adj_list << [x + 1, y+ 1] if (x + 1 < 8 && y + 1 < 8) && constraints_are_met?(x + 1, y + 1)
        adj_list << [x - 1, y + 1] if (x - 1 >= 0 && y + 1 < 8) && constraints_are_met?(x - 1, y + 1)
        adj_list << [x + 1, y - 1] if (x + 1 < 8 && y - 1 >= 0) && constraints_are_met?(x + 1, y - 1)                 
        adj_list << [x - 1, y - 1] if (x - 1 >= 0 && y - 1 >= 0) && constraints_are_met?(x - 1, y - 1) 
        adj_list
    end

end