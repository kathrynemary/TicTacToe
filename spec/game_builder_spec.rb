require_relative '../game_builder'

describe GameBuilder do
		
	it "should set up a single_player game" do
		allow(GameTypeInterface).to receive(:ask_game_type) {1}     
		allow(SymbolInterface).to receive(:get_symbol).with(:player1) {"X"}
		allow(SymbolInterface).to receive(:get_symbol).with(:player2) {"O"}
		allow(OrderInterface).to receive(:ask_first_player) {:player1}
		@example = GameBuilder.new
		expect(@example.game_setup).to eq(SinglePlayer)
  end

  it "should set up a two_player game" do	
		allow(GameTypeInterface).to receive(:ask_game_type) {2} 
		allow(SymbolInterface).to receive(:get_symbol).with(:player1) {"X"}
		allow(SymbolInterface).to receive(:get_symbol).with(:player2) {"O"}
		allow(OrderInterface).to receive(:ask_first_player) {:player1}
		@example = GameBuilder.new
		expect(@example.game_setup).to eq(TwoPlayer)
	end

	it "should set up a two_computer game" do
		allow(GameTypeInterface).to receive(:ask_game_type) {3} 
		allow(SymbolInterface).to receive(:get_symbol).with(:player1) {"X"}
		allow(SymbolInterface).to receive(:get_symbol).with(:player2) {"O"}
		allow(OrderInterface).to receive(:ask_first_player) {:player1}
		@example = GameBuilder.new
		expect(@example.game_setup).to eq(TwoComputer)
	end

  it "should choose a symbol for player1" do
		allow(GameTypeInterface).to receive(:ask_game_type) {1} 
    allow(SymbolInterface).to receive(:get_symbol).with(:player1) {"X"} 
    allow(SymbolInterface).to receive(:get_symbol).with(:player2) {"O"} 
		allow(OrderInterface).to receive(:ask_first_player) {:player1}
		@example = GameBuilder.new
    expect(@example.player1symbol).to eq("X")
		expect(@example.player2symbol).to eq("O")
	end

  it "should allow you to select player1 as the 1st player" do 
		allow(GameTypeInterface).to receive(:ask_game_type) {3} 
    allow(SymbolInterface).to receive(:get_symbol).with(:player1) {"X"} 
    allow(SymbolInterface).to receive(:get_symbol).with(:player2) {"O"} 
    allow(OrderInterface).to receive(:first_player_answer) {"1"}
		@example = GameBuilder.new
    expect(@example.first_player).to eq(:player1)    
  end

  it "should allow you to select player2 as the 1st player" do	
		allow(GameTypeInterface).to receive(:ask_game_type) {1}     
		allow(SymbolInterface).to receive(:get_symbol).with(:player1) {"X"}
		allow(SymbolInterface).to receive(:get_symbol).with(:player2) {"O"}
    allow(OrderInterface).to receive(:first_player_answer) {"2"}
		@example = GameBuilder.new 
    expect(@example.first_player).to eq(:player2)    
  end
=begin
  it "correctly assigns 2nd player given player2 as the 1st player" do	
		allow(GameTypeInterface).to receive(:ask_game_type) {1}     
		allow(SymbolInterface).to receive(:get_symbol).with(:player1) {"X"}
		allow(SymbolInterface).to receive(:get_symbol).with(:player2) {"O"}
    allow(OrderInterface).to receive(:first_player_answer) {"2"}
		@example = GameBuilder.new 
    expect(@example.second_player).to eq(:player1)    
  end
=end
end

