require "./lib/pawn.rb"

RSpec.describe "pawn" do 
    subject{ Pawn.new("pawn","white") }

    context "legal_move?" do 
        it "returns true for a legal move" do 
            expect(subject.legal_move?([0,1],[0,3])).to eql(true)
        end
    end
end