require "./lib/chess_board.rb"
require "./lib/rook.rb"
require "./spec/helper_modules/rook_helpers.rb"

RSpec.configure do |c|
    c.include RookHelpers
end

RSpec.describe "Rook" do
    before(:each) do
        @chess_board = ChessBoard.new
        place_rook_on_row(2)
        @rook = @chess_board.square([0,2]).piece
    end

    # let(:rook){@chess_board.square([0,2]).piece}

    context "#legal_move?" do 
        it "allows rook to make a horizontal move" do 
            expect(@rook.legal_move?([7,2])).to eql(true)
        end

        it "allows rook to make a vertical move" do 
            expect(@rook.legal_move?([0,3])).to eql(true)
        end

        it "doesnt allow rook to make diagonal moves" do 
            expect(@rook.legal_move?([2,4])).to eql(false)
        end

        it "doesnt allow rook to jump over his own people" do 
            move_pawn([3,1],[3,2])
            expect(@rook.legal_move?([6,2])).to eql(false)
        end

        it "doesnt allow rook to jump over opponents" do 
            move_pawn([0,6],[0,5])
            expect(@rook.legal_move?([0,6])).to eql(false)
        end

        it "doesnt allow rook to capture his own people" do 
            move_pawn([3,1],[3,2])
            expect(@rook.legal_move?([3,2])).to eql(false)
        end

        it "allows rook to capture opponents" do
            expect(@rook.legal_move?([0,6])).to eql(true)            
        end
    end


end