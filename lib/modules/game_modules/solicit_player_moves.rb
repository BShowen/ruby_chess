require_relative "custom_error"
module SolicitPlayerMoves

    def solicit_move
        begin
            reply = gets.chomp[0..1]
            ensure_reply_was_given(reply)
            x_coordinate = validate_x_coordinate(reply[0])
            y_coordinate = validate_y_coordinate(reply[1])
        rescue StandardError => e
            puts e.message
            retry 
        end
        [x_coordinate,y_coordinate]
    end

    def validate_x_coordinate(x_coord)
        raise HumanInputError.new("invalid x coord") if /\d/.match(x_coord)
        converter = { "a" => 0, "b" => 1, "c" => 2, "d" => 3, "e" => 4, "f" => 5, "g" => 6, "h" => 7}
        x_coord = converter[x_coord]
        raise HumanInputError.new("x out of range") if x_coord == nil
        x_coord
    end

    def validate_y_coordinate(y_coord)
        ensure_y_coord_is_given(y_coord)
        y_coord = convert_to_integer(y_coord)
        ensure_y_is_in_range(y_coord)
        y_coord
    end

    def ensure_reply_was_given(reply)
        raise HumanInputError.new("blank reply") if /\w+/.match(reply) == nil
    end

    def ensure_y_coord_is_given(y_coord)
        raise HumanInputError.new("no y coord") if y_coord.nil?
    end

    def convert_to_integer(y_coord)
        Integer(y_coord) rescue raise HumanInputError.new("invalid y coord")
    end

    def ensure_y_is_in_range(y_coord)
        raise HumanInputError.new("y out of range") if y_coord < 0 || y_coord > 7
    end
end 