require "./lib/chess_board.rb"

RSpec.describe "ChessBoard" do 
    before(:each) do 
        @board = ChessBoard.new
    end

    context "#to_s" do 
        it "returns an chess board with characters set" do 
            expect(@board.to_s).to eql("7 | r | k | b | K | q | b | k | r |\n6 | p | p | p | p | p | p | p | p |\n5 |   |   |   |   |   |   |   |   |\n4 |   |   |   |   |   |   |   |   |\n3 |   |   |   |   |   |   |   |   |\n2 |   |   |   |   |   |   |   |   |\n1 | p | p | p | p | p | p | p | p |\n0 | r | k | b | K | q | b | k | r |\n  |---|---|---|---|---|---|---|---|\n    A   B   C   D   E   F   G   H   ")
        end
    end

    context "#move_piece" do
        it "returns false when selected square is empty" do
            expect(@board.move_piece([0,2],[0,3])).to eql(false)
        end

        it "returns false when selected piece is opponents piece" do 
            expect(@board.move_piece([0,7],[0,4])).to eql(false)
        end

        it "toggle between both players" do 
            @board.move_piece([0,0],[0,2])
            expect(@board.turn).to eql("black")
        end
    end
end
