module SlideMoves
    private    
    def ascending_row(current_coordinates, moves)
        current_color = square(current_coordinates).piece.color
        x = current_coordinates[0]
        y = current_coordinates[1]
        for i in 1..7
            break if (x + i > 7 || y + i > 7)
            moves[:north_east] << [x + i, y + i] if (x + i < 8 && y + i < 8) && constraints_are_met?([x + i, y + i], current_color)
            break if constraints_are_met?([x + i, y + i], current_color) == false
            break if square([x + i, y + i]).empty? == false
        end
    
        for i in 1..7
            break if (x - i < 0 || y - i < 0)
            moves[:south_west] << [x - i, y - i] if (x - i >= 0 && y - i >= 0) && constraints_are_met?([x - i, y - i], current_color)
            break if constraints_are_met?([x - i, y - i], current_color) == false
            break if square([x - i, y - i]).empty? == false
        end
        moves
    end
    
    def descending_row(current_coordinates, moves)
        current_color = square(current_coordinates).piece.color
        x = current_coordinates[0]
        y = current_coordinates[1]
        for i in 1..7
            break if (x - i < 0 || y + i > 7)
            moves[:north_west] << [x - i, y + i] if (x - i >= 0 && y + i < 8) && constraints_are_met?([x - i, y + i], current_color)
            break if constraints_are_met?([x - i, y + i], current_color) == false
            break if square([x - i, y + i]).empty? == false
        end
    
        for i in 1..7
            break if (x + i > 7 || y - i < 0 )
            moves[:south_east] << [x + i, y - i] if (x + i < 8 && y - i >= 0) && constraints_are_met?([x + i, y - i], current_color)
            break if constraints_are_met?([x + i, y - i], current_color) == false
            break if square([x + i, y - i]).empty? == false
        end
        moves
    end
    
    def vertical_row(current_coordinates, moves)
        current_color = square(current_coordinates).piece.color
        x = current_coordinates[0]
        y = current_coordinates[1]
        for i in 1..7
            break if (y + i > 7)
            moves[:north] << [x, y + i] if (y + i < 8) && constraints_are_met?([x, y + i], current_color)
            break if constraints_are_met?([x, y + i], current_color) == false
            break if square([x, y + i]).empty? == false
        end
    
        for i in 1..7
            break if (y - i < 0)
            moves[:south] << [x, y - i] if (y - i >= 0 ) && constraints_are_met?([x, y - i], current_color)
            break if constraints_are_met?([x, y - i], current_color) == false
            break if square([x, y - i]).empty? == false
        end
        moves
    end
    
    def horizontal_row(current_coordinates, moves)
        current_color = square(current_coordinates).piece.color
        x = current_coordinates[0]
        y = current_coordinates[1]
        for i in 1..7
            break if (x + i > 7)
            moves[:west] << [x + i, y] if (x + i < 8) && constraints_are_met?([x + i, y], current_color)
            break if constraints_are_met?([x + i, y], current_color) == false
            break if square([x + i, y]).empty? == false
        end
    
        for i in 1..7
            break if (x - i < 0)
            moves[:east] << [x - i, y] if (x - i >= 0 ) && constraints_are_met?([x - i, y], current_color)
            break if constraints_are_met?([x - i, y], current_color) == false
            break if square([x - i, y]).empty? == false
        end
        moves
    end
    
end