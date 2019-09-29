class Game 
    def pickup_piece(coords)
        $board.select_piece(coords)
    end
    
    def set_piece_down(starting_coords, end_coords)
        $board.move(starting_coords, end_coords)
    end
end