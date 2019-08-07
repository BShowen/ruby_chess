require "./lib/chess_board.rb"
require "./lib/king.rb"
require "./spec/helper_modules/king_helpers.rb"

RSpec.configure do |c|
    c.include KingHelpers
end

RSpec.describe "King" do

    before(:each) do 
        @chess_board = ChessBoard.new
        @king = @chess_board.square([3,0]).piece
        move_pawn_out_of_the_kings_way
    end
    
    # let(:king) {@chess_board.square([3,0]).piece}

    context "#legal_move?" do 
        it "returns true for legal move" do
            place_king_on_row(4)
            expect(@king.legal_move?([4,4])).to eql(true)
            expect(@king.legal_move?([2,4])).to eql(true)
        end

        it "doesnt allow king to go off the board" do 
            expect(@king.legal_move?([2,8])).to eql(false)
        end

        it "doesnt allow king to move more than one space at a time" do 
            expect(@king.legal_move?([3,2])).to eql(false)
        end

        it "doesnt allow king to capture his own people" do 
            expect(@king.legal_move?([4,0])).to eql(false)
        end

        it "doesnt allow king to move over its own pieces" do 
            expect(@king.legal_move?([5,2])).to eql(false)
        end

        it "allows king to capture opponents" do 
            place_king_on_row(5)
            expect(@king.legal_move?([3,6])).to eql(true)
            expect(@king.legal_move?([4,6])).to eql(true)
            expect(@king.legal_move?([2,6])).to eql(true)
        end

    end
end