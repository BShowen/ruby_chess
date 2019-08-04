require "./lib/rook.rb"

RSpec.describe "rook" do 
    subject{ Rook.new("rook","white") }

    context "legal_move?" do 
        it "returns true for a legal move" do 
            expect(subject.legal_move?([0,0],[0,7])).to eql(true)
        end
    end
end