require "./lib/chess_board.rb"

RSpec.describe do 
    before(:each) do 
        @board = ChessBoard.new
    end

    context "#display" do 
        it "returns an empty board" do 
            expect(@board.display).to eql("1 |   |   |   |   |   |   |   |   |\n2 |   |   |   |   |   |   |   |   |\n3 |   |   |   |   |   |   |   |   |\n4 |   |   |   |   |   |   |   |   |\n5 |   |   |   |   |   |   |   |   |\n6 |   |   |   |   |   |   |   |   |\n7 |   |   |   |   |   |   |   |   |\n8 |   |   |   |   |   |   |   |   |\n  |---|---|---|---|---|---|---|---|\n    A   B   C   D   E   F   G   H   ")
        end
    end
end
