require "./lib/bishop.rb"

RSpec.describe "bishop" do 
    subject{ Bishop.new("bishop","white") }

    context "legal_move?" do 
        it "returns true for a legal move" do 
            expect(subject.legal_move?([6,0],[0,6])).to eql(true)
        end
    end
end