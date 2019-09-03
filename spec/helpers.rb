module Helpers  
    def create_board_with_in_check_state
        @board.move([3,1],[3,3])
        @board.move([3,6],[3,4])
        @board.move([3,0],[3,1])
        @board.move([4,7],[0,3])
        @board.current_turn_color = :black
        @board.move([0,3],[3,3])
        @board.current_turn_color = :white
    end

    def create_board_with_check_mate_state
        @board.move([3,1],[3,3])
        @board.move([3,6],[3,4])
        @board.move([3,0],[3,1])
        @board.move([4,7],[0,3])
        @board.current_turn_color = :black
        @board.move([0,3],[3,3])
        @board.current_turn_color = :white
    end
end