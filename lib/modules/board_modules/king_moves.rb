module KingMoves
    private
    def king_moves(current_coordinates)
        x = current_coordinates[0]
        y = current_coordinates[1]
        moves = []
        moves << [x + 1, y] if (x + 1 < 8) && constraints_are_met?([x + 1, y]) #&& dont_go_in_check?(x + 1, y)
        moves << [x - 1, y] if (x - 1 >= 0) && constraints_are_met?([x - 1, y]) #&& dont_go_in_check?(x - 1,y)
        moves << [x, y + 1] if (y + 1 < 8) && constraints_are_met?([x, y + 1]) #&& dont_go_in_check?(x, y + 1)
        moves << [x, y - 1] if (y - 1 >= 0) && constraints_are_met?([x, y - 1]) #&& dont_go_in_check?(x, y - 1)
        moves << [x + 1, y+ 1] if (x + 1 < 8 && y + 1 < 8) && constraints_are_met?([x + 1, y + 1]) #&& dont_go_in_check?(x + 1, y + 1)
        moves << [x - 1, y + 1] if (x - 1 >= 0 && y + 1 < 8) && constraints_are_met?([x - 1, y + 1]) #&& dont_go_in_check?(x - 1, y + 1)
        moves << [x + 1, y - 1] if (x + 1 < 8 && y - 1 >= 0) && constraints_are_met?([x + 1, y - 1]) #&& dont_go_in_check?(x + 1, y - 1)
        moves << [x - 1, y - 1] if (x - 1 >= 0 && y - 1 >= 0) && constraints_are_met?([x - 1, y - 1]) #&& dont_go_in_check?(x - 1, y - 1)
        moves
    end

    
    # def dont_go_in_check?(x,y)
    #     if square([x,y]).empty? == true
    #         for row in 0..7 do 
    #             for column in 0..7 do 
    #                 next if square([column, row]).empty? || square([column, row]).piece.color == @current_turn_color || square([column, row]).piece.character == "K"
    #                 return false if square([column, row]).piece.get_legal_moves([column,row]).include?([x,y])
    #             end
    #         end
    #     end
    #     true 
    # end
end