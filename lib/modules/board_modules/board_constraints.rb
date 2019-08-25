require_relative "pawn_moves"
require_relative "king_moves"
require_relative "knight_moves"
require_relative "slide_moves"

module ChessBoardConstraints
    include PawnMoves
    include KingMoves
    include KnightMoves
    include SlideMoves

    private
    def get_moves_for_selected_piece(current_coords)
        moves = []
        case square(current_coords).piece.character
        when "K"
            moves += king_moves(current_coords)
        when "q"
            moves += horizontal_row(current_coords) + vertical_row(current_coords)
            moves += ascending_row(current_coords) + descending_row(current_coords)
        when "p"
            moves += pawn_moves(current_coords)
        when "k"
            moves += knight_moves(current_coords)
        when "r"
            moves += horizontal_row(current_coords) + vertical_row(current_coords)
        when "b"
            moves += ascending_row(current_coords) + descending_row(current_coords)
        end
        raise HumanInputError.new("no moves") if moves.empty?
        moves
    end

    # from here down are functions that raise errors when needed. 
    def selected_square_cannot_be_blank(from_here)
        raise HumanInputError.new("blank") if square(from_here).empty?
    end

    def selected_square_cannot_be_opponents_piece(from_here)
        raise HumanInputError.new("opponents piece") if square(from_here).piece.color != @current_turn_color
    end

    def validate_move_constraints(from_here, to_here)
        raise HumanInputError.new("not legal") if enforce_constraints_on_selected_piece(from_here, to_here) == false
    end
end