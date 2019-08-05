module CustomEnumerable
    def square(coordinates)
        row = coordinates[1]
        column = coordinates[0]
        $object_board[7 - row][column]
    end
end 