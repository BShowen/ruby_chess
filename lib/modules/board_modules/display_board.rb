module DisplayBoard

    def to_s
        if @display_board == nil
            @display_board = clone_object_board
            convert_each_square_to_string
            add_borders_and_numbers_to_board
        else
            @display_board.join
        end
    end

    private
    def set_colored_board(moves)
        @display_board = clone_object_board
        moves[:legal].each do |coord| 
            color_square(coord, :green)
        end
        moves[:illegal].each do |coord|
            color_square(coord, :red)
        end
        convert_each_square_to_string
        add_borders_and_numbers_to_board
    end

    def clone_object_board
        Marshal.load(Marshal.dump(@object_board))
    end

    # def convert_each_square_to_string
    #     @display_board.map! do |row|
    #         row.map! do |square|
    #             square.empty? ? " " : square.piece.character
    #         end
    #     end
    # end

    def convert_each_square_to_string
        @display_board.map! do |row|
            row.map! do |square|
                if square.background != nil
                    color = square.background
                    square.empty? ? " ".colorize(:background => color) : square.piece.character.colorize(:background => color)
                else
                    square.empty? ? " " : square.piece.character
                end
            end
        end
    end

    def this_square(coordinates)
        row = coordinates[1]
        column = coordinates[0]
        @display_board[7 - row][column]
    end

    def color_square(coord, color)
        this_square(coord).background = color
    end

    def add_borders_and_numbers_to_board
        @display_board.map!.with_index do |row,index|
            "#{7 - index} | #{row.join(" | ")} | #{7 - index}\n  |---|---|---|---|---|---|---|---|\n"
        end
        top_row = "  |---|---|---|---|---|---|---|---|\n"
        bottom_row = ["    A   B   C   D   E   F   G   H   "]
        @display_board.unshift(top_row)
        @display_board.push(bottom_row)
        @display_board.join
    end 
end