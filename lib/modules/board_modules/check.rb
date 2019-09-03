module Check
    private
    def get_potential_moves(starting_coords)
        potential_moves = {legal: [], illegal: []}
        get_moves_for_selected_piece(starting_coords).each_value do |attack_path|
            next if attack_path.empty?
            attack_path.each do |end_coord|
                make_temporary_move(starting_coords, end_coord)
                in_check? ? potential_moves[:illegal] << end_coord : potential_moves[:legal] << end_coord
                undo_temporary_move
            end
        end
        potential_moves
    end

    def can_teammates_help?(king)
        attack_path = get_attack_path(king) 
        each_square do |column, row, sqr|
            next if sqr.empty? || sqr.piece.color != @current_turn_color || get_potential_moves([column,row])[:legal].empty?
            get_potential_moves([column, row])[:legal].each do |coord|
                return true if attack_path.include?(coord)
            end
        end
        false
    end

    def get_attack_path(king)
        path = nil
        each_square do |column, row, sqr|
            next if sqr.empty? || sqr.piece.color == @current_turn_color
            get_moves_for_selected_piece([column, row]).each_value do |coords|
                if coords.include?(king)
                    path = coords 
                    path.unshift([column,row])
                    break 
                end
            end
        end
        path
    end

    def find_king_coords    
        each_square do |column, row, sqr|
            next if sqr.empty?
            return [column, row] if sqr.piece.character == "K" && sqr.piece.color == @current_turn_color
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