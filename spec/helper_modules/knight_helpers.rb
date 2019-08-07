module KnightHelpers
        def place_knight_on_square(coords)
            x = coords[0]
            y = coords[1]
            @chess_board.square([x,y]).piece = @chess_board.square(@knight.current_position).piece
            @chess_board.square(@knight.current_position).piece = nil
            @knight.current_position = coords
        end
end