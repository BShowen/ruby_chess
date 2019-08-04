require "./lib/knight.rb"

RSpec.describe "knight" do 
    subject{ Knight.new("knight","white") }

    context "legal_move?" do 
        it "returns true for a legal move" do 
            expect(subject.legal_move?([2,0],[3,2])).to eql(true)
        end
    end
end