module DisplayBoard
    private
    def colorize_moves(moves)
        @display_board = clone_object_board
        color_the_green_sqaures(moves[:good])
        color_the_red_squares(moves[:bad])
        convert_each_square_to_string
        add_borders_and_numbers_to_board
    end

    def clone_object_board
        Marshal.load(Marshal.dump(@object_board))
    end

    def color_the_green_sqaures(moves)
        moves.each do |coord| 
            color_square(coord, :green)
        end
    end

    def color_the_red_squares(moves)
        moves.each do |coord|
            color_square(coord, :red)
        end
    end

    def color_square(coord, color)
        this_square(coord).background = color
    end

    def this_square(coordinates)
        row = coordinates[1]
        column = coordinates[0]
        @display_board[7 - row][column]
    end

    def convert_each_square_to_string
        @display_board.map! do |row|
            row.map! do |square|
                if square.background 
                    color = square.background
                    square.empty? ? "   ".colorize(:background => color) : square.piece.character.center(3).colorize(:background => color)
                else
                    square.empty? ? "   " : square.piece.character.center(3)
                end
            end
        end
    end

    def add_borders_and_numbers_to_board
        @display_board.map!.with_index do |row,index|
            "#{7 - index} | #{row.join(" | ")} | #{7 - index}\n  |-----|-----|-----|-----|-----|-----|-----|-----|\n"
        end
        @display_board.unshift("  |-----|-----|-----|-----|-----|-----|-----|-----|\n")
        @display_board.push("     A     B     C     D     E     F     G     H     ")
        @display_board.join
    end 
end