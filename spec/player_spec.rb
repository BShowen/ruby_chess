require "./lib/player.rb"
require "./lib/chess_board.rb"

RSpec.describe "Player" do
    let(:player){Player.new("John",'white')}
    let(:chess_board){ChessBoard.new}

    context "#solicit_move" do 
        it "solicits humnan for coordinates to move a chess piece" do 
            chess_board
            allow(player).to receive(:gets){"d1"}
            expect(player.solicit_move).to eql([3,1])
        end
    end

    context "#validate_x_coordinate" do 
        it "sanitizes input to ensure x coordinate is in range" do 
            expect{ player.validate_x_coordinate("t") }.to raise_error(HumanInputError, "X coordinate is out of range")
        end
         
        it "sanitizes input to ensure x cooridnate is a letter" do 
            expect{ player.validate_x_coordinate("4") }.to raise_error(HumanInputError, "X coordinate must be a letter")
        end
    end

    context "#validate_y_coordinate" do 
        it "sanitizes input to ensure y coordinate is in range" do 
            expect{ player.validate_y_coordinate("9") }.to raise_error(HumanInputError, "Y coordinate is out of range")
        end

        it "sanitizes input to ensure y coordinate is a number" do 
            expect{ player.validate_y_coordinate("g") }.to raise_error(HumanInputError, "Y coordinate must be a number")
        end
    end

    context "#ensure_reply_was_given" do 
        it "raises error if empty reply is given" do 
            expect{ player.ensure_reply_was_given("") }.to raise_error(HumanInputError, "You must type something")    
        end

        it "raises error if blank space reply is given" do 
            expect{ player.ensure_reply_was_given(" ") }.to raise_error(HumanInputError, "You must type something")    
        end
    end
end