require "./lib/game.rb"

RSpec.describe "Game" do 
    subject {Game.new}

    context "#legal_move?" do
        it "returns true for legal move" do 
            expect(subject.legal_move?([1,0],[2,2])).to eql(true)
        end

        it "returns false for illegal move" do 
            expect(subject.legal_move?([1,0],[4,0])).to eql(false)
        end
    end

    context "#can_make_move?" do 
        xit "returns true if piece can make the move" do 
            expect(subject.can_make_move?([0,0],[0,2])).to eql(false)
        end
    end
end