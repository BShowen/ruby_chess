require_relative "basic_chess_piece"

class Pawn < BasicChessPiece

    def build_adj_list   
        completed_list = []
        for x in 0..7
            for y in 0..7
                temp_list = []
                temp_list << [x, y + 1] if (y + 1 <= 7 && @color == "white")
                temp_list << [x, y + 2] if (y == 1 && @color == "white")

                temp_list << [x, y - 1] if (y - 1 >= 0 && @color == "black")
                temp_list << [x, y - 2] if (y == 6 && @color == "black")
                completed_list << temp_list          
            end
        end
        completed_list
    end

end