require "./lib/chess_board.rb"
require "./lib/queen.rb"
require "./spec/helper_modules/helpers.rb"

RSpec.configure do |c|
    c.include Helpers
  end

RSpec.describe "Queen" do

    before(:each) do
        @chess_board = ChessBoard.new
        @queen = @chess_board.square([4,0]).piece
        # move_pawn_out_of_the_queens_way
        move_pawn([4,1],[4,3])
    end
    
    context "#legal_move?" do 
        it "returns true for legal move" do
            expect(@queen.legal_move?([4,1])).to eql(true)
        end

        it "doesnt allow queen to go off the board" do 
            expect(@queen.legal_move?([4,8])).to eql(false)
        end

        it "doesnt allow queen to move onto her own people" do 
            expect(@queen.legal_move?([4,3])).to eql(false)
        end

        it "doesnt allow queen to move over its own pieces" do 
            expect(@queen.legal_move?([6,2])).to eql(false)
            expect(@queen.legal_move?([4,4])).to eql(false)
            expect(@queen.legal_move?([2,2])).to eql(false)
        end

        it "allows queen to capture opponents" do 
            place_piece_on_square(@queen,[4,4])
            expect(@queen.legal_move?([2,6])).to eql(true)
            expect(@queen.legal_move?([6,6])).to eql(true)
            expect(@queen.legal_move?([4,6])).to eql(true)
        end

    end

end