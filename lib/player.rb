require_relative "custom_error"

class Player

    attr_accessor  :name, :color

    def initialize(name, color)
        @name = name
        @color = color
    end

    def solicit_move
        # puts "Choose a piece to move by selecting the xy coordinate"
        begin
            reply = gets.chomp[0..1]
            ensure_reply_was_given(reply)
            x_coordinate = validate_x_coordinate(reply[0])
            y_coordinate = validate_y_coordinate(reply[1])
        rescue HumanInputError => e
            puts e.message
            retry 
        end
        [x_coordinate,y_coordinate]
    end


    def ensure_reply_was_given(reply)
        raise HumanInputError, "You must type something" if /\w+/.match(reply) == nil
    end

        def validate_y_coordinate(y_coord)
            raise HumanInputError, "You didnt enter a Y coordinate" if y_coord.nil?
            # raise HumanInputError, "Y coordinate must be a number" if /\D/.match(y_coord)
            Integer(y_coord) rescue raise HumanInputError, "Y coordinate must be a number" 
            y_coord = y_coord.to_i
            raise HumanInputError, "Y coordinate is out of range" if y_coord < 0 || y_coord > 7
            y_coord
        end

    def validate_x_coordinate(x_coord)
        raise HumanInputError, "X coordinate must be a letter" if /\d/.match(x_coord)
        case x_coord.downcase
        when "a"
            0
        when "b"
            1
        when "c"
            2
        when "d"
            3
        when "e"
            4
        when "f"
            5
        when "g"
            6
        when "h"
            7
        else
            raise HumanInputError, "X coordinate is out of range"
        end
    end
end