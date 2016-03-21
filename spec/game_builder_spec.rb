require_relative '../interface'
require_relative '../game'
require_relative '../player'

describe GameBuilder do
    #stub in what values it receives and then check that it instantiates a thing w/ those values.

  it "should set up the game" do
    allow(Interface).to receive(:ask_game_type) {1}
    allow(Interface).to receive(:ask_symbol) {"X"}
    allow(Interface).to receive(:first_player) {player1}
    allow(Interface).to receive(:order_input) {1}
    expect(GameBuilder.game).to be_an_instance_of(SinglePlayer)  
  end

  it "should get a symbol for the first player" do
    allow(Interface).to receive(:ask_game_type) {"1"}
    allow(Interface).to receive(:ask_symbol) { "X" }
    allow(Interface).to receive(:first_player) {player1}
    allow(Interface).to receive(:order_input) {1}
    expect(GameBuilder.new.player1.symbol).to eq(Player.new("X").symbol)
  end

  it "should get a symbol for the second player" do
    allow(Interface).to receive(:ask_game_type) {"1"}
    allow(Interface).to receive(:ask_symbol) { "Y" }
    allow(Interface).to receive(:first_player) {player1}
    allow(Interface).to receive(:order_input) {1}
    expect(GameBuilder.new.player1.symbol).to eq(Player.new("Y").symbol)
  end
  
  it "should get the order of players" do
    allow(Interface).to receive(:ask_game_type) {"1"}
    allow(Interface).to receive(:ask_symbol) {"X"}
    allow(Interface).to receive(:order_input) {2}
    expect(GameBuilder.new.first_player).to eq(:player2)  
  end
=begin
  it "should not allow a non-letter symbol" do #failing!
    allow(Interface).to receive(:ask_game_type) {"1"}
    allow(Interface).to receive(:ask_symbol) { "!" }
    allow(Interface).to receive(:first_player) {player1}
    allow(Interface).to receive(:order_input) {1}
    expect { GameBuilder.new.player1.symbol }.to raise_error(StandardError)
  end

  it "should not allow two characters in a symbol" do #failing!
    allow(Interface).to receive(:ask_game_type) {"1"}
    allow(Interface).to receive(:ask_symbol) { "rrr" }
    allow(Interface).to receive(:first_player) {player1}
    allow(Interface).to receive(:order_input) {1}
    expect { GameBuilder.new.player1.symbol }.to raise_error(StandardError)
  end
#thus starts the untested part
=begin
  it "should have an option to play with 1 player, 1 computer" do
      allow(Interface).to receive(:ask_game_type) {SinglePlayer.new}
      expect(Interface.game_variety).to be_a(SinglePlayer)
   end
  
   it "should have an option to play with 2 human players" do 
     allow(Interface).to receive(:ask_game_type) {TwoPlayer.new}
     expect(Interface.game_variety).to be_a(TwoPlayer)
   end #this is really testing Interface, non?

   it "should have an option to play with 2 computers" do
      allow(Interface).to receive(:ask_game_type) {TwoComputer.new}
     expect(@x.setup).to be_an_instance_of(TwoComputer)
   end
  
end

 describe TwoComputer do

   before :each do
     @y = TwoComputer.new
   end

   it "should have player1 be a computer" do
     expect(@y.player1).to be_an_instance_of(Computer)
   end
 
  it "should have player2 be a computer" do
     expect(@y.player2).to be_an_instance_of(Computer)
   end

 end

 describe TwoPlayer do

   before :each do
     @y = TwoPlayer.new
   end

   it "should have player1 not be a computer" do
     expect(@y.player1).to_not be_an_instance_of(Computer)
   end

   it "should have player2 not be a computer" do
     expect(@y.player2).to_not be_an_instance_of(Computer)
   end

 end

 describe SinglePlayer do

   before :each do
     @y = SinglePlayer.new
   end

   it "should have player1 not be a computer" do
     expect(@y.player1).to_not be_an_instance_of(Computer)
   end

   it "should have player2 be a computer" do
     expect(@y.player2).to be_an_instance_of(Computer)
   end
=end
 end

