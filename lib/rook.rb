class Rook
    attr_accessor :character, :adjacency_list

    def initialize(color)
        @color = color
        @character = "r"
        @adjacency_list = build_adj_list
    end

    def build_adj_list   
        completed_list = []
        for x in 0..7
            for y in 0..7
                temp_list = []
                temp_list << [x + 1, y] unless (x + 1 > 7)
                temp_list << [x + 2, y] unless (x + 2 > 7)
                temp_list << [x + 3, y] unless (x + 3 > 7)
                temp_list << [x + 4, y] unless (x + 4 > 7)
                temp_list << [x + 5, y] unless (x + 5 > 7)
                temp_list << [x + 6, y] unless (x + 6 > 7)
                temp_list << [x + 7, y] unless (x + 7 > 7)

                temp_list << [x - 1, y] unless (x - 1 < 0)
                temp_list << [x - 2, y] unless (x - 2 < 0)
                temp_list << [x - 3, y] unless (x - 3 < 0)
                temp_list << [x - 4, y] unless (x - 4 < 0)
                temp_list << [x - 5, y] unless (x - 5 < 0)
                temp_list << [x - 6, y] unless (x - 6 < 0)
                temp_list << [x - 7, y] unless (x - 7 < 0)

                temp_list << [x, y + 1] unless (y + 1 > 7)
                temp_list << [x, y + 2] unless (y + 2 > 7)
                temp_list << [x, y + 3] unless (y + 3 > 7)
                temp_list << [x, y + 4] unless (y + 4 > 7)
                temp_list << [x, y + 5] unless (y + 5 > 7)
                temp_list << [x, y + 6] unless (y + 6 > 7)
                temp_list << [x, y + 7] unless (y + 7 > 7)

                temp_list << [x, y - 1] unless (y - 1 < 0)
                temp_list << [x, y - 2] unless (y - 2 < 0)
                temp_list << [x, y - 3] unless (y - 3 < 0)
                temp_list << [x, y - 4] unless (y - 4 < 0)
                temp_list << [x, y - 5] unless (y - 5 < 0)
                temp_list << [x, y - 6] unless (y - 6 < 0)
                temp_list << [x, y - 7] unless (y - 7 < 0)

                
                completed_list << temp_list          
            end
        end
        completed_list
    end

    def display_adj_list
        @adjacency_list.each do |data|
            puts "#{data}"
        end
    end 

    def get_index_from_coordinates(coordinates)
        index = coordinates.join.to_i
        if index <= 7
            index
        elsif index <= 17
            index - 2
        elsif index <= 27
            index - 4
        elsif index <= 37
            index - 6
        elsif index <= 47
            index - 8
        elsif index <= 57
            index -10
        elsif index <= 67
            index - 12
        elsif index <= 77
            index - 14
        end
    end 

end