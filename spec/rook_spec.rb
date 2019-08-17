require "./lib/chess_board.rb"
require "./lib/chess_piece_classes/rook.rb"
require "./spec/helper_modules/helpers.rb"

RSpec.configure do |c|
    c.include Helpers
end

RSpec.describe "Rook" do
    before(:each) do
        @chess_board = ChessBoard.new
        @rook = @chess_board.square([0,0]).piece
    end

    context "#legal_move?" do 
        it "returns array of posible moves" do 
            expect(@rook.get_moves).to contain_exactly([0,1],[0,2],[0,3],[0,4],[0,5],[0,6],[0,7],[1,0],[2,0],[3,0],[4,0],[5,0],[6,0],[7,0])
        end

        it "doesnt allow rook to go off board" do 
            expect(@rook.get_moves).not_to include([0,8],[8,0])
        end

        it "doesnt allow rook to move diagonally" do 
            expect(@rook.get_moves).not_to include([1,1])
        end
    end
end