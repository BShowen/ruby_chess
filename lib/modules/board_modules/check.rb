module Check
    private
    def legal_moves(starting_coords)
        valid_moves = {good: [], bad: []}
        get_moves_for_selected_piece(starting_coords).each do |row, coords|
            next if coords.empty?
            coords.each do |end_coord|
                make_temporary_move(starting_coords, end_coord)
                in_check? ? valid_moves[:bad] << end_coord : valid_moves[:good] << end_coord
                undo_temporary_move
            end
        end
        valid_moves
    end

    def can_teammates_help?(king)
        attack_path = get_attack_path(king)
        for row in 0..7 do 
            for column in 0..7 do 
                sqr = square([column, row])
                next if sqr.empty? || sqr.piece.color != @current_turn_color || legal_moves([column, row])[:good].empty?
                legal_moves([column, row])[:good].each do |coord|
                    return true if attack_path.include?(coord)
                end
            end
        end
        false
    end

    def get_attack_path(king)
        path = nil
        for row in 0..7 do 
            for column in 0..7 do 
                sqr = square([column, row])
                next if sqr.empty? || sqr.piece.color == @current_turn_color
                get_moves_for_selected_piece([column, row]).select do |row, coords|
                    path = coords if coords.include?(king)
                    break if path != nil
                end
            end
        end
        path
    end

    def find_king_coords
        for row in 0..7 do 
            for column in 0..7 do 
                sqr = square([column, row])
                next if sqr.empty?
                return [column, row] if sqr.piece.character == "K" && sqr.piece.color == @current_turn_color
            end
        end
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