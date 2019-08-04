require "./lib/queen.rb"

RSpec.describe "queen" do 
    subject{ Queen.new("queen","white") }

    context "legal_move?" do 
        it "returns true for a legal move" do 
            expect(subject.legal_move?([4,0],[0,4])).to eql(true)
        end
    end
end