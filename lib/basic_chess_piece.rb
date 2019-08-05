require_relative "custom_enumerable"

class BasicChessPiece 
    include CustomEnumerable
    attr_accessor :character, :adjacency_list, :color

    def initialize(character, color)
        @color = color
        @character = character
        @adjacency_list = build_adj_list
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

    # def display_adj_list
    #     @adjacency_list.each do |data|
    #         puts "#{data}"
    #     end
    # end 
    
end