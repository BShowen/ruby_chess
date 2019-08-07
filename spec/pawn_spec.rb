require "./lib/chess_board.rb"
require "./lib/pawn.rb"
require "./spec/helper_modules/pawn_helpers.rb"

RSpec.configure do |c|
    c.include PawnHelpers
end

RSpec.describe "White Pawn" do
    
    before(:each) do 
        @chess_board = ChessBoard.new
        @pawn = @chess_board.square([3,1]).piece
    end

    context "#legal_move?" do 
        it "returns true for legal move" do
            expect(@pawn.legal_move?([3,2])).to eql(true)
            expect(@pawn.legal_move?([3,3])).to eql(true)
        end

        it "doesnt allow pawn to move more than one space" do 
            expect(@pawn.legal_move?([3,4])).to eql(false)
        end

        it "allows pawn to move forward two spaces on first move only" do 
            expect(@pawn.legal_move?([3,3])).to eql(true)
            move_pawn([3,1],[3,2])
            expect(@pawn.legal_move?([3,4])).to eql(false) 
        end

        it "doesnt allow pawn to move backwards" do 
            move_pawn([3,1],[3,2])
            expect(@pawn.legal_move?([3,1])).to eql(false) 
        end

        it "doesnt allow pawn to go off the board" do 
            move_pawn([3,1],[3,7])
            expect(@pawn.legal_move?([0,8])).to eql(false) 
        end

        it "doesnt allow pawn to move in a horizontal line" do 
            move_pawn([3,1],[3,2])
            expect(@pawn.legal_move?([4,2])).to eql(false)
        end

        it "doesnt allow pawn to capture his own people" do 
            move_knight_in_front_of_pawn
            expect(@pawn.legal_move?([2,2])).to eql(false)
        end

        it "doesnt allow pawn to move onto his own people" do 
            move_knight_in_front_of_pawn
            move_pawn([3,1],[2,1])
            expect(@pawn.legal_move?([2,2])).to eql(false)
        end

        it "doesnt allow pawn to move over his own people" do 
            move_knight_in_front_of_pawn
            move_pawn([3,1],[2,1])
            expect(@pawn.legal_move?([2,3])).to eql(false)
        end

        it "allows pawn move diagonally only to capture opponent" do 
            move_pawn([3,1],[3,5])
            expect(@pawn.legal_move?([4,6])).to eql(true)
            move_pawn([3,5],[3,1])
            expect(@pawn.legal_move?([4,2])).to eql(false)
        end
    end
end

RSpec.describe "Black Pawn" do

    before(:each) do 
        @chess_board = ChessBoard.new
        @pawn = @chess_board.square([3,6]).piece
    end

    context "#legal_move?" do 
        it "returns true for legal move" do
            expect(@pawn.legal_move?([3,5])).to eql(true)
            expect(@pawn.legal_move?([3,4])).to eql(true)
        end

        it "doesnt allow pawn to move more than one space" do 
            expect(@pawn.legal_move?([3,3])).to eql(false)
        end

        it "allows pawn to move forward two spaces on first move only" do 
            expect(@pawn.legal_move?([3,4])).to eql(true)
            move_pawn([3,6],[3,5])
            expect(@pawn.legal_move?([3,3])).to eql(false) 
        end

        it "doesnt allow pawn to move backwards" do 
            move_pawn([3,6],[3,5])
            expect(@pawn.legal_move?([3,5])).to eql(false) 
        end

        it "doesnt allow pawn to go off the board" do 
            move_pawn([3,6],[3,0])
            expect(@pawn.legal_move?([3,-1])).to eql(false) 
        end

        it "doesnt allow pawn to move in a horizontal line" do 
            move_pawn([3,6],[3,5])
            expect(@pawn.legal_move?([4,5])).to eql(false)
        end

        it "doesnt allow pawn to capture his own people" do 
            move_knight_in_front_of_pawn
            expect(@pawn.legal_move?([2,5])).to eql(false)
        end

        it "doesnt allow pawn to move onto his own people" do 
            move_knight_in_front_of_pawn
            move_pawn([3,6],[2,6])
            expect(@pawn.legal_move?([2,5])).to eql(false)
        end

        it "doesnt allow pawn to move over his own people" do 
            move_knight_in_front_of_pawn
            move_pawn([3,6],[2,6])
            expect(@pawn.legal_move?([2,4])).to eql(false)
        end

        it "allows pawn move diagonally only to capture opponent" do 
            move_pawn([3,6],[3,2])
            expect(@pawn.legal_move?([2,1])).to eql(true)
            expect(@pawn.legal_move?([2,2])).to eql(false)
            move_pawn([3,2],[3,6])
            expect(@pawn.legal_move?([4,5])).to eql(false)
        end
    end
end