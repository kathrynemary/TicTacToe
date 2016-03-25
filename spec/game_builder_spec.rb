require_relative '../game_builder'

describe GameBuilder do

  it "should set up a single_player game" do
    allow(GameTypeInterface).to receive(:ask_game_type) {1} 
    expect(GameBuilder.game_setup).to be_an_instance_of(SinglePlayer)
  end

  it "should set up a two_player game" do
    allow(GameTypeInterface).to receive(:ask_game_type) {2} 
    expect(GameBuilder.game_setup).to be_an_instance_of(TwoPlayer)
  end
  
  it "should set up a two_computer game" do
    allow(GameTypeInterface).to receive(:ask_game_type) {3} 
    expect(GameBuilder.game_setup).to be_an_instance_of(TwoComputer)
  end

  it "should choose a symbol for player1" do
    allow(SymbolInterface).to receive(:ask_symbol).with(:player1) {"X"} 
    allow(SymbolInterface).to receive(:ask_symbol).with(:player2) {"O"} 
    GameBuilder.game_symbols
    expect(GameBuilder.player1symbol).to eq("X")
    expect(GameBuilder.player2symbol).to eq("O")
  end

  it "should allow you to select player1 as the 1st player" do
    allow(OrderInterface).to receive(:ask_first_player) {1}
    GameBuilder.get_order
    expect(GameBuilder.first_player).to eq(:player1)    
  end

end

#it should get the game's order for player1 or player2 to go 1st
