module SlideMoves
    private
    def ascending_row(from_these_coords)
        row = []
        x = from_these_coords[0]
        y = from_these_coords[1]
        for i in 1..7
            break if (x + i > 7 || y + i > 7)
            row << [x + i, y + i] if (x + i < 8 && y + i < 8) && constraints_are_met?([x + i, y + i])
            break if constraints_are_met?([x + i, y + i]) == false
            break if square([x + i, y + i]).empty? == false
        end

        for i in 1..7
            break if (x - i < 0 || y - i < 0)
            row << [x - i, y - i] if (x - i >= 0 && y - i >= 0) && constraints_are_met?([x - i, y - i])
            break if constraints_are_met?([x - i, y - i]) == false
            break if square([x - i, y - i]).empty? == false
        end
        row
    end

    def descending_row(from_these_coords)
        row = []
        x = from_these_coords[0]
        y = from_these_coords[1]
        for i in 1..7
            break if (x + i > 7 || y - i < 0 )
            row << [x + i, y - i] if (x + i < 8 && y - i >= 0) && constraints_are_met?([x + i, y - i])
            break if constraints_are_met?([x + i, y - i]) == false
            break if square([x + i, y - i]).empty? == false
        end

        for i in 1..7
            break if (x - i < 0 || y + i > 7)
            row << [x - i, y + i] if (x - i >= 0 && y + i < 8) && constraints_are_met?([x - i, y + i])
            break if constraints_are_met?([x - i, y + i]) == false
            break if square([x - i, y + i]).empty? == false
        end
        row
    end

    def vertical_row(from_these_coords)
        row = []
        x = from_these_coords[0]
        y = from_these_coords[1]
        for i in 1..7
            break if (y + i > 7)
            row << [x, y + i] if (y + i < 8) && constraints_are_met?([x, y + i])
            break if constraints_are_met?([x, y + i]) == false
            break if square([x, y + i]).empty? == false
        end

        for i in 1..7
            break if (y - i < 0)
            row << [x, y - i] if (y - i >= 0 ) && constraints_are_met?([x, y - i])
            break if constraints_are_met?([x, y - i]) == false
            break if square([x, y - i]).empty? == false
        end
        row
    end

    def horizontal_row(from_these_coords)
        row = []
        x = from_these_coords[0]
        y = from_these_coords[1]
        for i in 1..7
            break if (x + i > 7)
            row << [x + i, y] if (x + i < 8) && constraints_are_met?([x + i, y])
            break if constraints_are_met?([x + i, y]) == false
            break if square([x + i, y]).empty? == false
        end

        for i in 1..7
            break if (x - i < 0)
            row << [x - i, y] if (x - i >= 0 ) && constraints_are_met?([x - i, y])
            break if constraints_are_met?([x - i, y]) == false
            break if square([x - i, y]).empty? == false
        end
        row
    end
end