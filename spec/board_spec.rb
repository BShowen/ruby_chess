require "./lib/classes/chess_board.rb"

RSpec.describe "ChessBoard" do 
    before(:each) do 
        @board = ChessBoard.new
    end

    context "#to_s" do 
        it "returns an chess board with characters set" do 
            expect(@board.to_s).to eql("7 | r | k | b | K | q | b | k | r | 7\n6 | p | p | p | p | p | p | p | p | 6\n5 |   |   |   |   |   |   |   |   | 5\n4 |   |   |   |   |   |   |   |   | 4\n3 |   |   |   |   |   |   |   |   | 3\n2 |   |   |   |   |   |   |   |   | 2\n1 | p | p | p | p | p | p | p | p | 1\n0 | r | k | b | K | q | b | k | r | 0\n  |---|---|---|---|---|---|---|---|\n    A   B   C   D   E   F   G   H   ")
        end
    end
end
