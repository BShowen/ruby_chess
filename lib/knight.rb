require_relative "basic_chess_piece"
require_relative "custom_enumerable"

class Knight < BasicChessPiece
    include CustomEnumerable

    def get_legal_moves(current_coordinates)
        adj_list = []
        x = current_coordinates[0]
        y = current_coordinates[1]
        adj_list << [x - 2,y - 1] if (x - 2 >= 0 && y - 1 >= 0) &&  square([x - 2, y - 1]).empty? 
        adj_list << [x - 2,y + 1] if (x - 2 >= 0 && y + 1 < 8)  && square([x - 2, y + 1]).empty?               
        adj_list << [x + 2,y - 1] if (x + 2 < 8 && y - 1 >= 0) && square([x + 2, y - 1]).empty?
        adj_list << [x + 2,y + 1] if (x + 2 < 8 && y + 1 < 8) &&  square([x + 2, y + 1]).empty? 
        adj_list << [x - 1,y - 2] if (y - 2 >= 0 && x - 1 >= 0) && square([x - 1, y - 2]).empty?
        adj_list << [x + 1,y - 2] if (y - 2 >= 0 && x + 1 < 8) && square([x + 1, y - 2]).empty?
        adj_list << [x - 1,y + 2] if (y + 2 < 8 && x - 1 >= 0) && square([x - 1, y + 2]).empty?                 
        adj_list << [x + 1,y + 2] if (y + 2 < 8 && x + 1 < 8) && square([x + 1, y + 2]).empty?      
        adj_list
    end

end