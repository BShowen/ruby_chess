require_relative "basic_chess_piece"

class Pawn < BasicChessPiece

    attr_accessor :moved
    def initialize(*args_for_super)
        @moved = false
        super
    end

    def get_legal_moves
        x = @current_position[0]
        y = @current_position[1]
        if @color == "white"
            adj_list = []
            adj_list << [x, y + 1] 
            adj_list << [x, y + 2] if @moved == false
            adj_list << [x + 1, y + 1]
            adj_list << [x - 1, y + 1]
        else
            adj_list << [x, y - 1]
            adj_list << [x, y - 2] if @moved == false
            adj_list << [x + 1, y - 1] 
            adj_list << [x - 1, y - 1] 
            adj_list
        end
    end

    private
    def diagonal_constraints_are_met?(x,y)
        square([x, y]).empty? == false && square([x, y]).piece.color != self.color
    end

    def square_is_empty?(coords)
        x = coords[0]
        y = coords[1]
        square([x, y]).empty? == true
    end

end