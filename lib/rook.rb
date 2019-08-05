require_relative "basic_chess_piece"

class Rook < BasicChessPiece

    def get_legal_moves(current_coordinates)
        x = current_coordinates[0]
        y = current_coordinates[1]
        adj_list = []
        adj_list << [x + 1, y] if (x + 1 < 8) && constraints_are_met?(x + 1, y)
        adj_list << [x + 2, y] if (x + 2 < 8) && constraints_are_met?(x + 2, y)
        adj_list << [x + 3, y] if (x + 3 < 8) && constraints_are_met?(x + 3, y)
        adj_list << [x + 4, y] if (x + 4 < 8) && constraints_are_met?(x + 4, y)
        adj_list << [x + 5, y] if (x + 5 < 8) && constraints_are_met?(x + 5, y)
        adj_list << [x + 6, y] if (x + 6 < 8) && constraints_are_met?(x + 6, y)
        adj_list << [x + 7, y] if (x + 7 < 8) && constraints_are_met?(x + 7, y)

        adj_list << [x - 1, y] if (x - 1 >= 0) && constraints_are_met?(x - 1, y)
        adj_list << [x - 2, y] if (x - 2 >= 0) && constraints_are_met?(x - 2, y)
        adj_list << [x - 3, y] if (x - 3 >= 0) && constraints_are_met?(x - 3, y)
        adj_list << [x - 4, y] if (x - 4 >= 0) && constraints_are_met?(x - 4, y)
        adj_list << [x - 5, y] if (x - 5 >= 0) && constraints_are_met?(x - 5, y)
        adj_list << [x - 6, y] if (x - 6 >= 0) && constraints_are_met?(x - 6, y)
        adj_list << [x - 7, y] if (x - 7 >= 0) && constraints_are_met?(x - 7, y)

        adj_list << [x, y + 1] if (y + 1 < 8) && constraints_are_met?(x, y + 1)
        adj_list << [x, y + 2] if (y + 2 < 8) && constraints_are_met?(x, y + 2)
        adj_list << [x, y + 3] if (y + 3 < 8) && constraints_are_met?(x, y + 3)
        adj_list << [x, y + 4] if (y + 4 < 8) && constraints_are_met?(x, y + 4)
        adj_list << [x, y + 5] if (y + 5 < 8) && constraints_are_met?(x, y + 5)
        adj_list << [x, y + 6] if (y + 6 < 8) && constraints_are_met?(x, y + 6)
        adj_list << [x, y + 7] if (y + 7 < 8) && constraints_are_met?(x, y + 7)

        adj_list << [x, y - 1] if (y - 1 >= 0) && constraints_are_met?(x, y - 1)
        adj_list << [x, y - 2] if (y - 2 >= 0) && constraints_are_met?(x, y - 2)
        adj_list << [x, y - 3] if (y - 3 >= 0) && constraints_are_met?(x, y - 3)
        adj_list << [x, y - 4] if (y - 4 >= 0) && constraints_are_met?(x, y - 4)
        adj_list << [x, y - 5] if (y - 5 >= 0) && constraints_are_met?(x, y - 5)
        adj_list << [x, y - 6] if (y - 6 >= 0) && constraints_are_met?(x, y - 6)
        adj_list << [x, y - 7] if (y - 7 >= 0) && constraints_are_met?(x, y - 7)
        adj_list
    end

end