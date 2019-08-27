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
        puts "Good: #{valid_moves[:good]}"
        puts "Bad: #{valid_moves[:bad]}"
        valid_moves
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

    def in_check?
        king = find_king_coords
        for row in 0..7 do 
            for column in 0..7 do 
                next if square([column, row]).empty? || square([column, row]).piece.color == @current_turn_color || square([column, row]).piece.character == "K"
                get_moves_for_selected_piece([column, row]).each do |row, coords|
                    next if coords.empty?
                    coords.each do 
                        return true if coords.include?(king)
                    end
                end
            end
        end
        false
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
        @stack.push(piece_info)
        square(ending_coords).piece = square(starting_coords).piece
        square(starting_coords).piece = nil
    end

    def undo_temporary_move
        move_data = @stack.pop
        square(move_data[:capturer][:starting_position]).piece = move_data[:capturer][:piece]
        square(move_data[:captured][:last_position]).piece = move_data[:captured][:piece]
    end

    # def get_search_path(hash, king_coords)
    #     hash.select do |key, val|
    #         val.include?(king_coords)
    #     end.first_value
    # end
    
    # class Hash
    #     def first_value
    #         self.values[0]
    #     end
    # end

    # def save_current_board_state 
    #     @temp_board = clone_object_board
    # end

    # def revert_board_state
    #     @object_board = @temp_board
    #     @temp_board = nil
    # end
end