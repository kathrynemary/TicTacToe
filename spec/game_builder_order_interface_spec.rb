require_relative '../Interface/game_builder_order_interface'
require_relative '../Interface/game_builder_game_type_interface'

describe OrderInterface do

  it "gets the order for the players if 1st player is 1st" do 
    allow(OrderInterface).to receive(:first_player) {:player1}
    expect(OrderInterface.first_player).to eq(:player1) 
    expect(OrderInterface.second_player).to eq(:player2) 
  end

  it "gets the order for the 1st player if player2 is 1st" do 
    allow(OrderInterface).to receive(:first_player) {:player2} 
    expect(OrderInterface.first_player).to eq(:player2) 
  end
 
  it "gets the order for the 2nd player if player2 is 1st" do 
    allow(OrderInterface).to receive(:first_player) {:player2} 
    expect(OrderInterface.second_player).to eq(:player1) 
  end

  it "won't let you pick a bad thing for player order" do 
    expect { OrderInterface.get_first_player("x") }.to raise_error(Errors::InputError) 
  end
 
  it "to put player1 as 1st player when 1 is picked" do
    OrderInterface.get_first_player("1") 
    expect(OrderInterface.first_player).to eq(:player1)
  end
  
  it "should call player1 'the second human' in a SinglePlayer game" do
    GameTypeInterface.game_type(1)
    GameTypeInterface.game_variety 
    expect(OrderInterface.first_player_text).to include("you")
  end
  
  it "should call player2 'the second human' in a SinglePlayer game" do
    GameTypeInterface.game_type(1)
    GameTypeInterface.game_variety 
    expect(OrderInterface.first_player_text).to include("the computer")
  end

  it "should call player1 'the second human' in a TwoPlayer game" do
    GameTypeInterface.game_type(2)
    GameTypeInterface.game_variety 
    expect(OrderInterface.first_player_text).to include("the first human")
  end

  it "should call player2 'the second human' in a TwoPlayer game" do
    GameTypeInterface.game_type(2)
    GameTypeInterface.game_variety 
    expect(OrderInterface.first_player_text).to include("the second human")
  end
 
  it "should call player1 'the first computer' in a TwoComputer game" do
    GameTypeInterface.game_type(3)
    GameTypeInterface.game_variety 
    expect(OrderInterface.first_player_text).to include("the first computer")
  end
  
  it "should call player2 'the second computer' in a TwoComputer game" do
    GameTypeInterface.game_type(3)
    GameTypeInterface.game_variety
    expect(OrderInterface.first_player_text).to include("the second computer")
  end

end
