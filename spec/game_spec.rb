require "./lib/classes/game.rb"

RSpec.describe "Game" do
    before(:each) do
        @game = Game.new
    end

    context "#turn" do 
        it "returns the color of whos turn it is" do 
            expect(@game.turn).to eql(:white)
        end
    end

    context "#toggle_turn" do 
        it "call #toggle_turn to change whos turn it is" do 
            expect(@game.toggle_turn).to eql(:black)
        end
    end

    context "#solicit_move" do 
        it "ensures a reply was given" do 
            allow(@game).to receive(:gets).and_return("  ","a0")
            expect{@game.solicit_move}.to output("You must type something\n").to_stdout
        end

        it "validates the x coordinate to ensure it is in range" do 
            allow(@game).to receive(:gets).and_return("z0","a0")
            expect{@game.solicit_move}.to output("X coordinate is out of range\n").to_stdout
        end
        
        it "validates the x coordinate to ensure it is a letter" do 
            allow(@game).to receive(:gets).and_return("00","a0")
            expect{@game.solicit_move}.to output("X coordinate must be a letter\n").to_stdout
        end

        it "validates the y coordinate to ensure it is in range" do 
            allow(@game).to receive(:gets).and_return("a9","a0")
            expect{@game.solicit_move}.to output("Y coordinate is out of range\n").to_stdout
        end
        
        it "validates the y coordinate to ensure it is a number" do 
            allow(@game).to receive(:gets).and_return("az","a0")
            expect{@game.solicit_move}.to output("Y coordinate must be a number\n").to_stdout
        end

        it "ensures a reply was given" do 
            allow(@game).to receive(:gets).and_return("  ", "a0")
            expect{@game.solicit_move}.to output("You must type something\n").to_stdout
        end
    end
end