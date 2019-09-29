module SolicitPlayerMoves 
    # private
    def self.save_game?(reply)
        reply == "sv" ? true : false    
    end 

    def self.validate_x_coordinate(x_coord)
        raise HumanInputError.new("X coordinate must be a letter") if /\d/.match(x_coord)
        converter = { "a" => 0, "b" => 1, "c" => 2, "d" => 3, "e" => 4, "f" => 5, "g" => 6, "h" => 7}
        x_coord = converter[x_coord]
        raise HumanInputError.new("X coordinate is out of range") if x_coord == nil
        x_coord
    end

    def self.validate_y_coordinate(y_coord)
        ensure_y_coord_is_given(y_coord)
        y_coord = convert_to_integer(y_coord)
        ensure_y_is_in_range(y_coord)
        y_coord
    end

    def self.ensure_reply_was_given(reply)
        raise HumanInputError.new("You must type something") if /\w+/.match(reply) == nil
    end

    def self.ensure_y_coord_is_given(y_coord)
        raise HumanInputError.new("You didnt enter a Y coordinate") if y_coord.nil?
    end

    def self.convert_to_integer(y_coord)
        Integer(y_coord) rescue raise HumanInputError.new("Y coordinate must be a number")
    end

    def self.ensure_y_is_in_range(y_coord)
        raise HumanInputError.new("Y coordinate is out of range") if y_coord < 0 || y_coord > 7
    end
end 