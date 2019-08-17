class BasicChessPiece 
    
    attr_accessor :character, :color, :current_position, :moved

    def initialize(character, color, current_position)
        @character = character
        @color = color
        @current_position = current_position 
        @moved = false
    end
    
    # def constraints_are_met?(x,y)
    #     square([x, y]).empty? == true || square([x, y]).piece.color != self.color
    # end

    def legal_move?(desired_coordinates)
        self.get_legal_moves(self.current_position).include?(desired_coordinates)
    end

end