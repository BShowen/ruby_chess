require_relative "basic_chess_piece"

class King < BasicChessPiece

    def get_legal_moves
        x = @current_position[0]
        y = @current_position[1]
        adj_list = []
        adj_list << [x + 1, y]
        adj_list << [x - 1, y]
        adj_list << [x, y + 1]
        adj_list << [x, y - 1] 
        adj_list << [x + 1, y+ 1]
        adj_list << [x - 1, y + 1]
        adj_list << [x + 1, y - 1]
        adj_list << [x - 1, y - 1]
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