require "./lib/king.rb"

RSpec.describe "king" do 
    subject{ King.new("king","white") }

    context "legal_move?" do 
        it "returns true for a legal move" do 
            expect(subject.legal_move?([3,0],[2,1])).to eql(true)
        end
    end
end