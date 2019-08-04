require_relative "basic_chess_piece"

class King < BasicChessPiece

    def build_adj_list   
        completed_list = []
        for x in 0..7
            for y in 0..7
                temp_list = []
                temp_list << [x + 1, y] unless (x + 1 > 7)
                temp_list << [x - 1, y] unless (x - 1 < 0)                 
                temp_list << [x, y + 1] unless (y + 1 > 7)
                temp_list << [x, y - 1] unless (y - 1 < 0)                 
                temp_list << [x + 1, y+ 1] unless (x + 1 > 7 || y + 1 > 7)
                temp_list << [x - 1, y + 1] unless (x - 1 < 0 || y + 1 > 7)
                temp_list << [x + 1, y - 1] unless (x + 1 > 7 || y - 1 < 0)                 
                temp_list << [x - 1, y - 1] unless (x - 1 < 0 || y - 1 < 0) 
                completed_list << temp_list          
            end
        end
        completed_list
    end

end