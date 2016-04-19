require_relative '../Interface/game_builder_symbol_interface'

describe SymbolInterface do

  before :each do
		@example = SymbolInterface.new("x", "y")
  end

  it "should throw an error if you give a multicharacter symbol" do
    expect { @example.verify_input("yyy") }.to raise_error(Errors::InputError)
  end
  
  it "should throw an error if you give a number for a symbol" do
    expect { @example.verify_input("4") }.to raise_error(Errors::InputError)
  end

  it "should throw an error if you give a nonletter symbol" do
    expect { @example.verify_input("*") }.to raise_error(Errors::InputError)
  end
	
  it "should throw an error if the 2 symbols are the same" do
    allow(SymbolInterface).to receive(:assign_player1_symbol) {"X"}
    allow(SymbolInterface).to receive(:assign_player2_symbol) {"X"}
    expect { @example.check_equality }.to raise_error(Errors::InputError)
  end
	
	it "lets you assign symbol values to the players" do
		allow(@example).to receive(:player1symbol) {"w"}
		allow(@example).to receive(:player2symbol) {"t"}	
		expect(@example.player1symbol).to eq("w")
		expect(@example.player2symbol).to eq("t")
	end

end

