require_relative "basic_chess_piece"

class Knight < BasicChessPiece

    def build_adj_list   
        completed_list = []
        for x in 0..7
            for y in 0..7
                temp_list = []
                temp_list << [x - 2,y - 1] unless (x - 2 < 0 || y - 1 < 0)
                temp_list << [x - 2,y + 1] unless (x - 2 < 0 || y + 1 > 7)                 
                temp_list << [x + 2,y - 1] unless (x + 2 > 7 || y - 1 < 0)
                temp_list << [x + 2,y + 1] unless (x + 2 > 7 || y + 1 > 7)                 
                temp_list << [x - 1,y - 2] unless (y - 2 < 0 || x - 1 < 0)
                temp_list << [x + 1,y - 2] unless (y - 2 < 0 || x + 1 > 7)
                temp_list << [x - 1,y + 2] unless (y + 2 > 7 || x - 1 < 0)                 
                temp_list << [x + 1,y + 2] unless (y + 2 > 7 || x + 1 > 7) 
                completed_list << temp_list          
            end
        end
        completed_list
    end

end