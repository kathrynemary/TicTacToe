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
  
end
