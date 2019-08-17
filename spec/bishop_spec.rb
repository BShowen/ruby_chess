require "./lib/chess_board.rb"
require "./lib/chess_piece_classes/bishop.rb"
require "./spec/helper_modules/helpers.rb"

RSpec.configure do |c|
    c.include Helpers
end

RSpec.describe "Bishop" do

    before(:each) do 
        @chess_board = ChessBoard.new
        @bishop = @chess_board.square([2,0]).piece
    end
    
    context "#get_moves" do 
        it "white bishop: returns array of possible moves" do
            expect(@bishop.get_moves).to contain_exactly([3, 1], [4, 2], [5, 3], [6, 4], [7, 5], [1, 1], [0, 2])
        end

        it "black bishop: returns array of possible moves" do 
            @bishop = @chess_board.square([2,7]).piece
            expect(@bishop.get_moves).to contain_exactly([1,6],[0,5],[3,6],[4,5],[5,4],[6,3],[7,2])
        end
    end
end