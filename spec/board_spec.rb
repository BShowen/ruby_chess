require "./lib/classes/board.rb"


RSpec.describe "ChessBoard" do 
    before(:each) do 
        @board = Board.new
    end

    context "#to_s" do 
        it "returns an chess board with characters set" do 
            expect(@board.to_s).to eql("7 | r | k | b | K | q | b | k | r | 7\n6 | p | p | p | p | p | p | p | p | 6\n5 |   |   |   |   |   |   |   |   | 5\n4 |   |   |   |   |   |   |   |   | 4\n3 |   |   |   |   |   |   |   |   | 3\n2 |   |   |   |   |   |   |   |   | 2\n1 | p | p | p | p | p | p | p | p | 1\n0 | r | k | b | K | q | b | k | r | 0\n  |---|---|---|---|---|---|---|---|\n    A   B   C   D   E   F   G   H   ")
        end
    end

    context "#select_piece" do 
        it "validates that the selected square is allowed to be selected player selecting it" do 
            expect{@board.select_piece([0,1], :white)}.not_to raise_error
        end

        it "raises an error when opponents piece is selected" do 
            expect{@board.select_piece([0,7], :white)}.to raise_error("You cannot select opponents pieces")
        end

        it "raises an error when a blank square is selected" do 
            expect{@board.select_piece([0,3],:white)}.to raise_error("That square is empty. Select a playing piece")
        end

        it "raises an error when a square with no possible moves is selected" do 
            expect{@board.select_piece([0,0],:white)}.to raise_error("That piece has no legal moves. Try another piece")
        end
    end

    context "#move" do 
        it "raises error when the attempted move illegal" do 
            @board.instance_variable_set(:@current_turn_color, :white)
            expect{@board.move([0,1],[0,5])}.to raise_error("That move is not legal")
        end

        it "doesnt raise error when the attempted move is legal" do 
            @board.instance_variable_set(:@current_turn_color, :white)
            expect{@board.move([0,1],[0,3])}.not_to raise_error
        end
    end
end
