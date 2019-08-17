require "./lib/chess_board.rb"
require "./lib/chess_piece_classes/knight.rb"
require "./spec/helper_modules/helpers.rb"

RSpec.configure do |c|
    c.include Helpers
end

RSpec.describe "Knight" do

    before(:each) do 
        @chess_board = ChessBoard.new
        @white_knight = @chess_board.square([1,0]).piece
        @black_knight = @chess_board.square([1,7]).piece
    end

    context "#get_moves" do 
        it "white kinght: returns array of moves the knight can make" do
            place_piece_on_square(@white_knight,[4,4])
            expect(@white_knight.get_moves).to contain_exactly([3,2],[5,2],[6,3],[6,5],[2,3],[2,5],[5,6],[3,6])
        end

        it "black knight: returns array of moves the knight can make" do 
            expect(@black_knight.get_moves).to contain_exactly([0,5],[2,5],[3,6])
        end
        
    end
end