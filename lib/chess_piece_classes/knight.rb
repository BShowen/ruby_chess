require_relative "basic_chess_piece"

class Knight < BasicChessPiece

    def get_moves
        x = @current_position[0]
        y = @current_position[1]
        adj_list = []
        adj_list << [x - 2,y - 1] if (x - 2 >= 0 && y - 1 >= 0)
        adj_list << [x - 2,y + 1] if (x - 2 >= 0 && y + 1 < 8) 
        adj_list << [x + 2,y - 1] if (x + 2 < 8 && y - 1 >= 0) 
        adj_list << [x + 2,y + 1] if (x + 2 < 8 && y + 1 < 8)
        adj_list << [x - 1,y - 2] if (y - 2 >= 0 && x - 1 >= 0)
        adj_list << [x + 1,y - 2] if (y - 2 >= 0 && x + 1 < 8) 
        adj_list << [x - 1,y + 2] if (y + 2 < 8 && x - 1 >= 0) 
        adj_list << [x + 1,y + 2] if (y + 2 < 8 && x + 1 < 8)
        adj_list   
    end

end