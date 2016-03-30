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

  it "should choose a symbol for player1" do #this one isn't passing
    allow(SymbolInterface).to receive(:get_symbol).with(:player1) {"X"} 
    allow(SymbolInterface).to receive(:get_symbol).with(:player2) {"O"} 
    GameBuilder.game_symbols
    expect(GameBuilder.player1symbol).to eq("X")
    expect(GameBuilder.player2symbol).to eq("O")
  end

  it "should allow you to select player1 as the 1st player" do 
    allow(OrderInterface).to receive(:first_player_answer) {"1"}
    GameBuilder.get_order 
    expect(GameBuilder.first_player).to eq(:player1)    
  end
  
  it "should allow you to select player2 as the 1st player" do 
    allow(OrderInterface).to receive(:first_player_answer) {"2"}
    GameBuilder.get_order 
    expect(GameBuilder.first_player).to eq(:player2)    
  end

end

