require_relative "basic_chess_piece"

class King < BasicChessPiece

    def get_legal_moves(current_coordinates)
        x = current_coordinates[0]
        y = current_coordinates[1]
        adj_list = []
        adj_list << [x + 1, y] if (x + 1 < 8) && constraints_are_met?(x + 1, y) && dont_go_in_check?(x + 1, y)
        adj_list << [x - 1, y] if (x - 1 >= 0) && constraints_are_met?(x - 1, y) && dont_go_in_check?(x - 1,y)
        adj_list << [x, y + 1] if (y + 1 < 8) && constraints_are_met?(x, y + 1) && dont_go_in_check?(x, y + 1)
        adj_list << [x, y - 1] if (y - 1 >= 0) && constraints_are_met?(x, y - 1) && dont_go_in_check?(x, y - 1)
        adj_list << [x + 1, y+ 1] if (x + 1 < 8 && y + 1 < 8) && constraints_are_met?(x + 1, y + 1) && dont_go_in_check?(x + 1, y + 1)
        adj_list << [x - 1, y + 1] if (x - 1 >= 0 && y + 1 < 8) && constraints_are_met?(x - 1, y + 1) && dont_go_in_check?(x - 1, y + 1)
        adj_list << [x + 1, y - 1] if (x + 1 < 8 && y - 1 >= 0) && constraints_are_met?(x + 1, y - 1) && dont_go_in_check?(x + 1, y - 1)
        adj_list << [x - 1, y - 1] if (x - 1 >= 0 && y - 1 >= 0) && constraints_are_met?(x - 1, y - 1) && dont_go_in_check?(x - 1, y - 1)
        adj_list
    end

    private
    def dont_go_in_check?(x,y)
        if square([x,y]).empty? == true
            for row in 0..7 do 
                for column in 0..7 do 
                    next if square([column, row]).empty? || square([column, row]).piece.color == self.color || square([column, row]).piece.character == "K"
                    return false if square([column, row]).piece.get_legal_moves([column,row]).include?([x,y])
                end
            end
        end
        true 
    end

end