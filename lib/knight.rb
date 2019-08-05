require_relative "basic_chess_piece"

class Knight < BasicChessPiece

    def get_legal_moves(current_coordinates)
        x = current_coordinates[0]
        y = current_coordinates[1]
        adj_list = []
        adj_list << [x - 2,y - 1] if (x - 2 >= 0 && y - 1 >= 0) && constraints_are_met?(x - 2, y - 1)
        adj_list << [x - 2,y + 1] if (x - 2 >= 0 && y + 1 < 8)  && constraints_are_met?(x - 2, y + 1)
        adj_list << [x + 2,y - 1] if (x + 2 < 8 && y - 1 >= 0) && constraints_are_met?(x + 2, y - 1)
        adj_list << [x + 2,y + 1] if (x + 2 < 8 && y + 1 < 8) &&  constraints_are_met?(x + 2, y + 1) 
        adj_list << [x - 1,y - 2] if (y - 2 >= 0 && x - 1 >= 0) && constraints_are_met?(x - 1, y - 2)
        adj_list << [x + 1,y - 2] if (y - 2 >= 0 && x + 1 < 8) && constraints_are_met?(x + 1, y - 2)
        adj_list << [x - 1,y + 2] if (y + 2 < 8 && x - 1 >= 0) && constraints_are_met?(x - 1, y + 2)                 
        adj_list << [x + 1,y + 2] if (y + 2 < 8 && x + 1 < 8) && constraints_are_met?(x + 1, y + 2)  
        adj_list
        # adj_list << [x - 2,y - 1] if (x - 2 >= 0 && y - 1 >= 0) &&  (square([x - 2, y - 1]).empty? == true || square([x - 2, y - 1]).color != self.color) 
        # adj_list << [x - 2,y + 1] if (x - 2 >= 0 && y + 1 < 8)  && square([x - 2, y + 1]).empty?               
        # adj_list << [x + 2,y - 1] if (x + 2 < 8 && y - 1 >= 0) && square([x + 2, y - 1]).empty?
        # adj_list << [x + 2,y + 1] if (x + 2 < 8 && y + 1 < 8) &&  square([x + 2, y + 1]).empty? 
        # adj_list << [x - 1,y - 2] if (y - 2 >= 0 && x - 1 >= 0) && square([x - 1, y - 2]).empty?
        # adj_list << [x + 1,y - 2] if (y - 2 >= 0 && x + 1 < 8) && square([x + 1, y - 2]).empty?
        # adj_list << [x - 1,y + 2] if (y + 2 < 8 && x - 1 >= 0) && square([x - 1, y + 2]).empty?                 
        # adj_list << [x + 1,y + 2] if (y + 2 < 8 && x + 1 < 8) && square([x + 1, y + 2]).empty?      
    end

end