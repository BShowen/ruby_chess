require_relative "basic_chess_piece"

class Pawn < BasicChessPiece

    def get_legal_moves(current_coordinates)
        x = current_coordinates[0]
        y = current_coordinates[1]
        adj_list = []
        adj_list << [x, y + 1] if (y + 1 < 8 && self.color == "white") && square_is_empty?([x, y + 1]) 
        adj_list << [x, y + 2] if (y == 1 && self.color == "white") && square_is_empty?([x, y + 1]) && square_is_empty?([x, y + 2])
        adj_list << [x + 1, y + 1] if (x + 1 < 8 && y + 1 < 8 && self.color == "white") && diagonal_constraints_are_met?(x + 1, y + 1)
        adj_list << [x - 1, y + 1] if (x - 1 >= 0 && y + 1 < 8 && self.color == "white") && diagonal_constraints_are_met?(x - 1, y + 1)

        adj_list << [x, y - 1] if (y - 1 >= 0 && self.color == "black") && square_is_empty?([x, y - 1]) 
        adj_list << [x, y - 2] if (y == 6 && self.color == "black") && square_is_empty?([x, y - 1]) && square_is_empty?([x, y - 2])
        adj_list << [x + 1, y - 1] if (x + 1 < 8 && y - 1 >= 0 && self.color == "black") && diagonal_constraints_are_met?(x + 1, y - 1)
        adj_list << [x - 1, y - 1] if (x - 1 >= 0 && y - 1 >= 0 && self.color == "black") && diagonal_constraints_are_met?(x - 1, y - 1)
        adj_list
    end

    private
    def diagonal_constraints_are_met?(x,y)
        square([x, y]).empty? == false && square([x, y]).piece.color != self.color
    end

    def square_is_empty?(coords)
        x = coords[0]
        y = coords[1]
        square([x, y]).empty? == true
    end

end