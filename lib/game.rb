require_relative "chess_board"
require_relative "custom_enumerable"

class Game
    include CustomEnumerable

    def initialize 
        @game_board = ChessBoard.new
    end

    def legal_move?(current_coordinates, desired_coordinates)
        chess_piece = square(current_coordinates).piece
        index = chess_piece.get_index_from_coordinates([current_coordinates])
        chess_piece.adjacency_list[index].include?(desired_coordinates)
    end

    def can_make_move?(current_coordinates, desired_coordinates)
        legal_move?(current_coordinates,desired_coordinates) && square(desired_coordinates).empty?
    end
end 