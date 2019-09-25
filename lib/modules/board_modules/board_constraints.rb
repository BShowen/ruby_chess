module BoardConstraints
    private
    def constraints_are_met?(coords, current_color)
        # square(coords).empty? == true || square(coords).piece.color != @current_turn_color
        square(coords).empty? == true || square(coords).piece.color != current_color
    end

    def selected_square_cannot_be_blank(coords)
        raise HumanInputError.new("That square is empty. Select a playing piece") if square(coords).empty?
    end

    def selected_square_cannot_be_opponents_piece(coords)
        raise HumanInputError.new("You cannot select opponents pieces") if square(coords).piece.color != @current_turn_color
    end
end