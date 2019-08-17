require "./lib/chess_board.rb"
require "./lib/chess_piece_classes/pawn.rb"
require "./spec/helper_modules/helpers.rb"

RSpec.configure do |c|
    c.include Helpers
end

RSpec.describe "White Pawn" do
    
    before(:each) do 
        @chess_board = ChessBoard.new
        @white_pawn = @chess_board.square([3,1]).piece
        @black_pawn = @chess_board.square([3,6]).piece
    end

    context "#get_moves" do 
        it "white pawn: returns array of possible moves" do 
            expect(@white_pawn.get_moves).to contain_exactly([3,2],[3,3],[4,2],[2,2])
        end 

        it "black pawn: returns array of pssible moves" do 
            expect(@black_pawn.get_moves).to contain_exactly([3,5],[3,4],[4,5],[2,5])
        end

    end
end