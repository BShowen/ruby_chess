require "./lib/chess_board.rb"

RSpec.describe do 
    before(:each) do 
        @board = ChessBoard.new
    end

    context "#display" do 
        it "returns an chess board with characters set" do 
            expect(@board.display).to eql("8 | r | k | b | K | q | b | k | r |\n7 | p | p | p | p | p | p | p | p |\n6 |   |   |   |   |   |   |   |   |\n5 |   |   |   |   |   |   |   |   |\n4 |   |   |   |   |   |   |   |   |\n3 |   |   |   |   |   |   |   |   |\n2 | p | p | p | p | p | p | p | p |\n1 | r | k | b | K | q | b | k | r |\n  |---|---|---|---|---|---|---|---|\n    A   B   C   D   E   F   G   H   ")
        end
    end
end
