require "./lib/chess_board.rb"

RSpec.describe do 
    before(:each) do 
        @board = ChessBoard.new
    end

    context "#display" do 
        it "returns an empty board" do 
            expect(@board.display).to eql("8 |   |   |   |   |   |   |   |   |\n7 |   |   |   |   |   |   |   |   |\n6 |   |   |   |   |   |   |   |   |\n5 |   |   |   |   |   |   |   |   |\n4 |   |   |   |   |   |   |   |   |\n3 |   |   |   |   |   |   |   |   |\n2 |   |   |   |   |   |   |   |   |\n1 |   |   |   |   |   |   |   |   |\n  |---|---|---|---|---|---|---|---|\n    A   B   C   D   E   F   G   H   ")
        end
    end
end
