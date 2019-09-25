module MoveValidation
    private
    def sanitized_moves(starting_coords)
        sanitized_moves = {good: [], bad: []}
        potential_moves(starting_coords).each_value do |path|
            next if path.empty?
            path.each do |end_coord|
                make_temporary_move(starting_coords, end_coord)
                in_check? ? sanitized_moves[:bad] << end_coord : sanitized_moves[:good] << end_coord
                undo_temporary_move
            end
        end
        sanitized_moves
    end

    def potential_moves(current_coords)
        moves = {
            north: [], 
            north_east: [],
            east: [],
            south_east: [], 
            south: [], 
            south_west: [], 
            west: [], 
            north_west: []
        }
        case square(current_coords).piece.character
        when "\u2654", "\u265A" #king
            moves = king_moves(current_coords, moves)
        when "\u2655", "\u265B" #queen
            moves = ascending_row(current_coords, moves)
            moves = descending_row(current_coords, moves)
            moves = vertical_row(current_coords, moves)
            moves = horizontal_row(current_coords, moves)
        when "\u2659", "\u265F" #pawn
            moves = pawn_moves(current_coords, moves)
        when "\u2658", "\u265E" #knight
            moves = knight_moves(current_coords, moves)
        when "\u2656", "\u265C" #rook
            moves = vertical_row(current_coords, moves)
            moves = horizontal_row(current_coords, moves)
        when "\u2657", "\u265D" #bishop
            moves = ascending_row(current_coords, moves)
            moves = descending_row(current_coords, moves)
        end
        moves
    end

    def make_temporary_move(starting_coords, ending_coords)
        piece_info = {
            captured: {
                piece: square(ending_coords).piece, 
                last_position: ending_coords,
            },
            capturer: {
                piece: square(starting_coords).piece,
                starting_position: starting_coords,
            }
        }
        @call_stack.push(piece_info)
        square(ending_coords).piece = square(starting_coords).piece
        square(starting_coords).piece = nil
    end

    def undo_temporary_move
        move_data = @call_stack.pop
        square(move_data[:capturer][:starting_position]).piece = move_data[:capturer][:piece]
        square(move_data[:captured][:last_position]).piece = move_data[:captured][:piece]
    end
end