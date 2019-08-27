require_relative "pawn_moves"
require_relative "king_moves"
require_relative "knight_moves"
require_relative "slide_moves"
require_relative "check.rb"

module ChessBoardConstraints
    include PawnMoves
    include KingMoves
    include KnightMoves
    include SlideMoves

    private
    def get_moves_for_selected_piece(current_coords)
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
        when "K"
            moves = king_moves(current_coords, moves)
        when "q"
            moves = ascending_row(current_coords, moves)
            moves = descending_row(current_coords, moves)
            moves = vertical_row(current_coords, moves)
            moves = horizontal_row(current_coords, moves)
        when "p"
            moves = pawn_moves(current_coords, moves)
        when "k"
            moves = knight_moves(current_coords, moves)
        when "r"
            moves = vertical_row(current_coords, moves)
            moves = horizontal_row(current_coords, moves)
        when "b"
            moves = ascending_row(current_coords, moves)
            moves = descending_row(current_coords, moves)
        end
        moves
    end

    def constraints_are_met?(coords, current_color)
        # square(coords).empty? == true || square(coords).piece.color != @current_turn_color
        square(coords).empty? == true || square(coords).piece.color != current_color
    end

    # from here down are functions that raise errors when needed. 
    def selected_square_cannot_be_blank(coords)
        raise HumanInputError.new("blank") if square(coords).empty?
    end

    def selected_square_cannot_be_opponents_piece(coords)
        raise HumanInputError.new("opponents piece") if square(coords).piece.color != @current_turn_color
    end
end