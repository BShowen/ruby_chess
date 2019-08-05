require_relative "basic_chess_piece"

class Pawn < BasicChessPiece

    def get_legal_moves(current_coordinates)
        x = current_coordinates[0]
        y = current_coordinates[1]
        adj_list = []
        adj_list << [x, y + 1] if (y + 1 < 8 && self.color == "white") && constraints_are_met?(x, y + 1)
        adj_list << [x, y + 2] if (y == 1 && self.color == "white") && constraints_are_met?(x, y + 2)

        adj_list << [x, y - 1] if (y - 1 >= 0 && self.color == "black") && constraints_are_met?(x, y - 1)
        adj_list << [x, y - 2] if (y == 6 && self.color == "black") && constraints_are_met?(x, y - 2)
        adj_list
    end

end