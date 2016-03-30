require_relative '../Interface/game_builder_symbol_interface'
require_relative '../Interface/game_builder_game_type_interface'

describe SymbolInterface do

  it "should throw an error if you give a multicharacter symbol" do
    expect { SymbolInterface.verify_input("yyy") }.to raise_error(Errors::InputError)
  end
  
  it "should throw an error if you give a number for a symbol" do
    expect { SymbolInterface.verify_input("4") }.to raise_error(Errors::InputError)
  end

  it "should throw an error if you give a nonletter symbol" do
    expect { SymbolInterface.verify_input("*") }.to raise_error(Errors::InputError)
  end

  it "should assign a symbol to player1" do
    expect(SymbolInterface.assign_player1_symbol("X")).to eq("X")
  end
  
  it "should assign a symbol to player2" do
    expect(SymbolInterface.assign_player2_symbol("O")).to eq("O")
  end

  it "should throw an error if the 2 symbols are the same" do
    SymbolInterface.assign_player1_symbol("X")
    SymbolInterface.assign_player2_symbol("X")
    expect { SymbolInterface.check_equality }.to raise_error(Errors::InputError)
  end

  it "should call player1 'the second human' in a SinglePlayer game" do
    GameTypeInterface.game_type(1)
    GameTypeInterface.game_variety 
    expect(SymbolInterface.ask_symbol(:player1)).to include("you")
  end
  
  it "should call player2 'the second human' in a SinglePlayer game" do
    GameTypeInterface.game_type(1)
    GameTypeInterface.game_variety 
    expect(SymbolInterface.ask_symbol(:player2)).to include("the computer")
  end

  it "should call player1 'the second human' in a TwoPlayer game" do
    GameTypeInterface.game_type(2)
    GameTypeInterface.game_variety 
    expect(SymbolInterface.ask_symbol(:player1)).to include("the first human")
  end

  it "should call player2 'the second human' in a TwoPlayer game" do
    GameTypeInterface.game_type(2)
    GameTypeInterface.game_variety 
    expect(SymbolInterface.ask_symbol(:player2)).to include("the second human")
  end
 
  it "should call player1 'the first computer' in a TwoComputer game" do
    GameTypeInterface.game_type(3)
    GameTypeInterface.game_variety 
    expect(SymbolInterface.ask_symbol(:player1)).to include("the first computer")
  end
  
  it "should call player2 'the second computer' in a TwoComputer game" do
    GameTypeInterface.game_type(3)
    GameTypeInterface.game_variety
    expect(SymbolInterface.ask_symbol(:player2)).to include("the second computer")
  end

end



