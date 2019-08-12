require "./lib/chess_board.rb"

RSpec.describe "ChessBoard" do 
    before(:each) do 
        @board = ChessBoard.new
    end

    context "#display" do 
        it "returns an chess board with characters set" do 
            expect(@board.display).to eql("7 | r | k | b | K | q | b | k | r |\n6 | p | p | p | p | p | p | p | p |\n5 |   |   |   |   |   |   |   |   |\n4 |   |   |   |   |   |   |   |   |\n3 |   |   |   |   |   |   |   |   |\n2 |   |   |   |   |   |   |   |   |\n1 | p | p | p | p | p | p | p | p |\n0 | r | k | b | K | q | b | k | r |\n  |---|---|---|---|---|---|---|---|\n    A   B   C   D   E   F   G   H   ")
        end
    end
end
