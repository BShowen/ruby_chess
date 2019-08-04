require_relative "basic_chess_piece"

class Queen < BasicChessPiece

    def build_adj_list   
        completed_list = []
        for x in 0..7
            for y in 0..7
                temp_list = []
                temp_list << [x + 1, y + 1] unless (x + 1 > 7 || y + 1 > 7)
                temp_list << [x + 2, y + 2] unless (x + 2 > 7 || y + 2 > 7)                 
                temp_list << [x + 3, y + 3] unless (x + 3 > 7 || y + 3 > 7)
                temp_list << [x + 4, y + 4] unless (x + 4 > 7 || y + 4 > 7)                 
                temp_list << [x + 5, y + 5] unless (x + 5 > 7 || y + 5 > 7)
                temp_list << [x + 6, y + 6] unless (x + 6 > 7 || y + 6 > 7)
                temp_list << [x + 7, y + 7] unless (x + 7 > 7 || y + 7 > 7)                 
                temp_list << [x - 1, y - 1] unless (x - 1 < 0 || y - 1 < 0)
                temp_list << [x - 2, y - 2] unless (x - 2 < 0 || y - 2 < 0)
                temp_list << [x - 3, y - 3] unless (x - 3 < 0 || y - 3 < 0)
                temp_list << [x - 4, y - 4] unless (x - 4 < 0 || y - 4 < 0)
                temp_list << [x - 5, y - 5] unless (x - 5 < 0 || y - 5 < 0)
                temp_list << [x - 6, y - 6] unless (x - 6 < 0 || y - 6 < 0)
                temp_list << [x - 7, y - 7] unless (x - 7 < 0 || y - 7 < 0)
                temp_list << [x + 1, y - 1] unless (x + 1 > 7 || y - 1 < 0)
                temp_list << [x + 2, y - 2] unless (x + 2 > 7 || y - 2 < 0)                 
                temp_list << [x + 3, y - 3] unless (x + 3 > 7 || y - 3 < 0)
                temp_list << [x + 4, y - 4] unless (x + 4 > 7 || y - 4 < 0)                 
                temp_list << [x + 5, y - 5] unless (x + 5 > 7 || y - 5 < 0)
                temp_list << [x + 6, y - 6] unless (x + 6 > 7 || y - 6 < 0)
                temp_list << [x + 7, y - 7] unless (x + 7 > 7 || y - 7 < 0)                 
                temp_list << [x - 1, y + 1] unless (x - 1 < 0 || y + 1 > 7)
                temp_list << [x - 2, y + 2] unless (x - 2 < 0 || y + 2 > 7)
                temp_list << [x - 3, y + 3] unless (x - 3 < 0 || y + 3 > 7)
                temp_list << [x - 4, y + 4] unless (x - 4 < 0 || y + 4 > 7)
                temp_list << [x - 5, y + 5] unless (x - 5 < 0 || y + 5 > 7)
                temp_list << [x - 6, y + 6] unless (x - 6 < 0 || y + 6 > 7)
                temp_list << [x - 7, y + 7] unless (x - 7 < 0 || y +7 > 7)

                temp_list << [x + 1, y] unless (x + 1 > 7)
                temp_list << [x + 2, y] unless (x + 2 > 7)
                temp_list << [x + 3, y] unless (x + 3 > 7)
                temp_list << [x + 4, y] unless (x + 4 > 7)
                temp_list << [x + 5, y] unless (x + 5 > 7)
                temp_list << [x + 6, y] unless (x + 6 > 7)
                temp_list << [x + 7, y] unless (x + 7 > 7)

                temp_list << [x - 1, y] unless (x - 1 < 0)
                temp_list << [x - 2, y] unless (x - 2 < 0)
                temp_list << [x - 3, y] unless (x - 3 < 0)
                temp_list << [x - 4, y] unless (x - 4 < 0)
                temp_list << [x - 5, y] unless (x - 5 < 0)
                temp_list << [x - 6, y] unless (x - 6 < 0)
                temp_list << [x - 7, y] unless (x - 7 < 0)

                temp_list << [x, y + 1] unless (y + 1 > 7)
                temp_list << [x, y + 2] unless (y + 2 > 7)
                temp_list << [x, y + 3] unless (y + 3 > 7)
                temp_list << [x, y + 4] unless (y + 4 > 7)
                temp_list << [x, y + 5] unless (y + 5 > 7)
                temp_list << [x, y + 6] unless (y + 6 > 7)
                temp_list << [x, y + 7] unless (y + 7 > 7)

                temp_list << [x, y - 1] unless (y - 1 < 0)
                temp_list << [x, y - 2] unless (y - 2 < 0)
                temp_list << [x, y - 3] unless (y - 3 < 0)
                temp_list << [x, y - 4] unless (y - 4 < 0)
                temp_list << [x, y - 5] unless (y - 5 < 0)
                temp_list << [x, y - 6] unless (y - 6 < 0)
                temp_list << [x, y - 7] unless (y - 7 < 0)
                completed_list << temp_list          
            end
        end
        completed_list
    end

end