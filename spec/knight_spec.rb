require "./lib/chess_board.rb"
require "./lib/knight.rb"
require "./spec/helper_modules/knight_helpers.rb"

RSpec.configure do |c|
    c.include KnightHelpers
end

RSpec.describe "Knight" do

    before(:each) do 
        @chess_board = ChessBoard.new
        @knight = @chess_board.square([1,0]).piece
    end

    context "#legal_move?" do 
        it "returns true for legal move" do
            expect(@knight.legal_move?([2,2])).to eql(true)
            expect(@knight.legal_move?([0,2])).to eql(true)
        end

        it "doesnt allow knight to go off the board" do 
            expect(@knight.legal_move?([2,8])).to eql(false)
        end

        it "doesnt allow knight to move in a straight line" do 
            expect(@knight.legal_move?([1,2])).to eql(false)
        end

        it "doesnt allow knight to move onto his own people" do 
            expect(@knight.legal_move?([3,1])).to eql(false)
        end

        it "allows knight to move over its own pieces" do 
            expect(@knight.legal_move?([2,2])).to eql(true)
        end

        it "allows knight to move over opponents" do 
            place_knight_on_square([4,5])
            expect(@knight.legal_move?([5,7])).to eql(true)
        end

        it "allows knight to capture opponents" do 
            place_knight_on_square([4,5])
            expect(@knight.legal_move?([5,7])).to eql(true)
        end

    end
end