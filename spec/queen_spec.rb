require "./lib/chess_board.rb"
require "./lib/chess_piece_classes/queen.rb"
require "./spec/helper_modules/helpers.rb"

RSpec.configure do |c|
    c.include Helpers
  end

RSpec.describe "Queen" do

    before(:each) do
        @chess_board = ChessBoard.new
        @queen = @chess_board.square([4,0]).piece
    end
    
    context "#get_moves" do 
        it "white queen: returns array of possible moves" do 
            expect(@queen.get_moves).to contain_exactly([5,0],[6,0],[7,0],[3,0],[2,0],[1,0],[0,0],[4,1],[4,2],[4,3],[4,4],[4,5],[4,6],[4,7],[5,1],[6,2],[7,3],[3,1],[2,2],[1,3],[0,4])
        end

        it "black queen: returns array of possible moves" do 
            @queen = @chess_board.square([4,7]).piece
            expect(@queen.get_moves).to contain_exactly([5,7],[6,7],[7,7],[3,7],[2,7],[1,7],[0,7],[4,6],[4,5],[4,4],[4,3],[4,2],[4,1],[4,0],[3,6],[2,5],[1,4],[0,3],[5,6],[6,5],[7,4])
        end
    end
end