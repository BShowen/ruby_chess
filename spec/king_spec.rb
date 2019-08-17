require "./lib/chess_board.rb"
require "./lib/chess_piece_classes/king.rb"
require "./spec/helper_modules/helpers.rb"

RSpec.configure do |c|
    c.include Helpers
end

RSpec.describe "King" do

    before(:each) do 
        @chess_board = ChessBoard.new
        @king = @chess_board.square([3,0]).piece
    end


    context "#get_moves" do 
        it "white king: returns array of moves the king can make" do
            place_piece_on_square(@king,[4,4])
            expect(@king.get_moves).to contain_exactly([5, 4], [3, 4], [4, 5], [4, 3], [5, 5], [3, 5], [5, 3], [3, 3])
        end

        it "black king: returns array of moves the king can make" do
            @king = @chess_board.square([3,7]).piece
            expect(@king.get_moves).to contain_exactly([4,7],[4,6],[3,6],[2,7],[2,6])
        end
    end
end