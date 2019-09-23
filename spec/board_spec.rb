require "./lib/classes/board.rb"
require_relative "helpers.rb"

RSpec.configure do |c|
    c.include Helpers
end


RSpec.describe "ChessBoard" do 
    before(:each) do 
        @board = Board.new
    end

    context "#to_s" do 
        it "returns an chess board with characters set" do 
            expect(@board.to_s).to eql("  |-----|-----|-----|-----|-----|-----|-----|-----|\n7 |  ♜  |  ♞  |  ♝  |  ♚  |  ♛  |  ♝  |  ♞  |  ♜  | 7\n  |-----|-----|-----|-----|-----|-----|-----|-----|\n6 |  ♟  |  ♟  |  ♟  |  ♟  |  ♟  |  ♟  |  ♟  |  ♟  | 6\n  |-----|-----|-----|-----|-----|-----|-----|-----|\n5 |     |     |     |     |     |     |     |     | 5\n  |-----|-----|-----|-----|-----|-----|-----|-----|\n4 |     |     |     |     |     |     |     |     | 4\n  |-----|-----|-----|-----|-----|-----|-----|-----|\n3 |     |     |     |     |     |     |     |     | 3\n  |-----|-----|-----|-----|-----|-----|-----|-----|\n2 |     |     |     |     |     |     |     |     | 2\n  |-----|-----|-----|-----|-----|-----|-----|-----|\n1 |  ♙  |  ♙  |  ♙  |  ♙  |  ♙  |  ♙  |  ♙  |  ♙  | 1\n  |-----|-----|-----|-----|-----|-----|-----|-----|\n0 |  ♖  |  ♘  |  ♗  |  ♔  |  ♕  |  ♗  |  ♘  |  ♖  | 0\n  |-----|-----|-----|-----|-----|-----|-----|-----|\n     A     B     C     D     E     F     G     H     ")
        end
    end

    context "#select_piece" do 
        it "validates that the selected square is allowed to be selected player selecting it" do 
            expect{@board.select_piece([0,1])}.not_to raise_error
        end

        it "raises an error when opponents piece is selected" do 
            expect{@board.select_piece([0,7])}.to raise_error("You cannot select opponents pieces")
        end

        it "raises an error when a blank square is selected" do 
            expect{@board.select_piece([0,3])}.to raise_error("That square is empty. Select a playing piece")
        end

        it "raises an error when a square with no possible moves is selected" do 
            expect{@board.select_piece([0,0])}.to raise_error("That piece has no legal moves. Try another piece")
        end
    end

    context "#move" do 
        it "raises error when the attempted move is illegal" do 
            expect{@board.move([0,1],[0,5])}.to raise_error("That move is not legal")
        end

        it "doesnt raise error when the attempted move is legal" do 
            expect{@board.move([0,1],[0,3])}.not_to raise_error
        end
    end

    context "#in_check?" do 
        it "returns false when board is not in check" do 
            expect(@board.in_check?).to be(false)
        end

        it "returns true when the board is in check" do 
            create_board_with_in_check_state
            expect(@board.in_check?).to be(true)
        end
    end

    context "#check_mate?" do
        it "returns false when board is not in check mate" do 
            expect(@board.check_mate?).to be(false)
        end 

        it "returns true when the board is in check mate" do 
            create_board_with_check_mate_state
            expect(@board.in_check?).to be(true)
        end
    end
end
