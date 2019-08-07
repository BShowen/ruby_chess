require_relative "basic_chess_piece"

class Queen < BasicChessPiece

    def get_legal_moves(current_coordinates)
        x = current_coordinates[0]
        y = current_coordinates[1]
        adj_list = []
        for i in 1..7 do 
            break if (x + i > 7 || y + i > 7)
            adj_list << [x + i, y + i] if (x + i < 8 && y + i < 8) && constraints_are_met?(x + i, y + i)
            break if constraints_are_met?(x + i, y + i) == false
            break if square([x + i, y + i]).empty? == false
        end       

        for i in 1..7 do 
            break if (x - i < 0 || y - i < 0)
            adj_list << [x - i, y - i] if (x - i >= 0 && y - i >= 0) && constraints_are_met?(x - i, y- i)    
            break if constraints_are_met?(x - i, y - i) == false
            break if square([x - i, y - i]).empty? == false
        end

        for i in 1..7 do 
            break if (x + i > 7 || y - i < 0)
            adj_list << [x + i, y - i] if (x + i < 8 && y - i >= 0) && constraints_are_met?(x + i, y - i)
            break if constraints_are_met?(x + i, y - i) == false
            break if square([x + i, y - i]).empty? == false
        end

        for i in 1..7 do 
            break if (x - i < 0 || y + i > 7)
            adj_list << [x - i, y + i] if (x - i >= 0 && y + i < 8)  && constraints_are_met?(x - i, y + i)  
            break if constraints_are_met?(x - i, y + i) == false
            break if square([x - i, y + i]).empty? == false
        end
        
        for i in 1..7 do 
            break if (x + i > 7)
            adj_list << [x + i, y] if (x + i < 8) && constraints_are_met?(x + i, y)
            break if constraints_are_met?(x + i, y) == false
            break if square([x + i, y]).empty? == false
        end

        for i in 1..7 do 
            break if (x - i < 0)
            adj_list << [x - i, y] if (x - i >= 0) && constraints_are_met?(x - i, y)
            break if constraints_are_met?(x - i, y) == false
            break if square([x - i, y]).empty? == false
        end

        for i in 1..7 do 
            break if (y + i > 7)
            adj_list << [x, y + i] if (y + i < 8) && constraints_are_met?(x, y + i)
            break if constraints_are_met?(x, y + i) == false
            break if square([x, y + i]).empty? == false
        end

        for i in 1..7 do 
            break if (y - i < 0)
            adj_list << [x, y - i] if (y - i >= 0) && constraints_are_met?(x, y - i)
            break if constraints_are_met?(x, y - i) == false
            break if square([x, y - i]).empty? == false
        end

        adj_list
    end

end