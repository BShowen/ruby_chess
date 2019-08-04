class King
    attr_accessor :character, :adjacency_list
    def initialize(color)
        @color = color
        @character = "K"
        @adjacency_list = build_adj_list
    end

    def build_adj_list   
        completed_list = []
        for x in 0..7
            for y in 0..7
                temp_list = []
                temp_list << [x + 1, y] unless (x + 1 > 7)
                temp_list << [x - 1, y] unless (x - 1 < 0)                 
                temp_list << [x, y + 1] unless (y + 1 > 7)
                temp_list << [x, y - 1] unless (y - 1 < 0)                 
                temp_list << [x + 1, y+ 1] unless (x + 1 > 7 || y + 1 > 7)
                temp_list << [x - 1, y + 1] unless (x - 1 < 0 || y + 1 > 7)
                temp_list << [x + 1, y - 1] unless (x + 1 > 7 || y - 1 < 0)                 
                temp_list << [x - 1, y - 1] unless (x - 1 < 0 || y - 1 < 0) 
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