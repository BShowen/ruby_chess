require "./lib/game.rb"

RSpec.describe "Game" do 
    subject {Game.new}

    context "#legal_move?" do
        it "returns true for legal move" do 
            expect(subject.legal_move?([0,0],[0,4])).to eql(true)
        end
    end
end