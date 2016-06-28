require 'spec_helper'

describe SymbolInterface do

  before :each do
		@example = SymbolInterface.new("x", "y")
  end

  it "should throw an error if you give a multicharacter symbol" do
    expect { @example.verify_input("yyy") }.to raise_error(Errors::UserError)
  end
  
  it "should throw an error if you give a number for a symbol" do
    expect { @example.verify_input("4") }.to raise_error(Errors::UserError)
  end

  it "should throw an error if you give a nonletter symbol" do
    expect { @example.verify_input("*") }.to raise_error(Errors::UserError)
  end
	
  it "should throw an error if the 2 symbols are the same" do
		expect { @example.check_equality("X", "X") }.to raise_error(Errors::UserError)
  end
	
	it "lets you assign symbol values to the players" do
		allow(@example).to receive(:player1symbol) {"w"}
		allow(@example).to receive(:player2symbol) {"t"}	
		expect(@example.player1symbol).to eq("w")
		expect(@example.player2symbol).to eq("t")
	end

end

