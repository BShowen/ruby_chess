require_relative "chess_board"
require_relative "custom_enumerable"

class Game

    include CustomEnumerable
    
    def initialize 
        @game_board = ChessBoard.new
    end

    def legal_move?(current_coordinates, desired_coordinates)
        chess_piece = square(current_coordinates).piece
        chess_piece.get_legal_moves(current_coordinates).include?(desired_coordinates)
    end
    
end 