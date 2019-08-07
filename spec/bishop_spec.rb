require "./lib/chess_board.rb"
require "./lib/bishop.rb"
require "./spec/helper_modules/bishop_helpers.rb"

RSpec.configure do |c|
    c.include BishopHelpers
end

RSpec.describe "Bishop" do

    before(:each) do 
        @chess_board = ChessBoard.new
        @bishop = @chess_board.square([2,0]).piece
    end

    after(:each) do 
        puts @chess_board.display
        puts "afer"
    end
    
    context "#legal_move?" do 
        it "returns true for legal move" do
            place_bishop_on_row(4)
            expect(@bishop.legal_move?([3,5])).to eql(true)
            expect(@bishop.legal_move?([3,3])).to eql(true)
            expect(@bishop.legal_move?([0,2])).to eql(true)
            expect(@bishop.legal_move?([1,5])).to eql(true)
        end

        it "doesnt allow bishop to go off the board" do 
            place_bishop_on_row(4)
            expect(@bishop.legal_move?([6,8])).to eql(false)
        end

        it "doesnt allow bishop to move vertically" do 
            place_bishop_on_row(4)
            expect(@bishop.legal_move?([2,3])).to eql(false)
        end

        it "doesnt allow bishop to move horizontally" do 
            place_bishop_on_row(4)
            expect(@bishop.legal_move?([4,4])).to eql(false)
        end

        it "doesnt allow bishop to move onto his own pieces" do 
            place_bishop_on_row(4)
            expect(@bishop.legal_move?([5,1])).to eql(false)
        end

        it "doesnt allow bishop to move over its own pieces" do 
            place_bishop_on_row(4)
            move_pawn([3,1],[3,3])
            expect(@bishop.legal_move?([4,2])).to eql(false)
        end

        it "requires bishop to stop on top of opponents pieces" do 
            place_bishop_on_row(4)
            expect(@bishop.legal_move?([5,7])).to eql(false)
            expect(@bishop.legal_move?([4,6])).to eql(true)
        end

        it "allows bishop to capture oppnents" do 
            place_bishop_on_row(2)
            expect(@bishop.legal_move?([6,6])).to eql(true)    
        end

    end
end