module Check
    private
    def can_teammates_help?(king)
        attack_path = get_attack_path(king) 
        each_square do |column, row, sqr|
            next if sqr.empty? || sqr.piece.color != @current_turn_color || sanitized_moves([column,row])[:good].empty?
            sanitized_moves([column, row])[:good].each do |coord|
                return true if attack_path.include?(coord)
            end
        end
        false
    end

    def get_attack_path(king)
        path = nil
        each_square do |column, row, sqr|
            next if sqr.empty? || sqr.piece.color == @current_turn_color
            potential_moves([column, row]).each_value do |coords|
                if coords.include?(king)
                    path = coords 
                    path.unshift([column,row]) #attack path needs to include the square that the attacker is standing on. 
                    break 
                end
            end
        end
        path
    end

    def find_king_coords    
        each_square do |column, row, sqr|
            next if sqr.empty?
            return [column, row] if sqr.piece.is_king? && sqr.piece.color == @current_turn_color
        end
    end
end