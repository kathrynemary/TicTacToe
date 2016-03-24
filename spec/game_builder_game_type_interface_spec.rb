require_relative '../Interface/game_builder_game_type_interface'

describe GameTypeInterface do

  it "should let you select a SinglePlayer game" do
    GameTypeInterface.game_type(1)
    expect(GameTypeInterface.game_variety).to be_an_instance_of(SinglePlayer)
  end

  it "should let you select a TwoPlayer game" do
    GameTypeInterface.game_type(2)
    expect(GameTypeInterface.game_variety).to be_an_instance_of(TwoPlayer)
  end

  it "should let you select a TwoComputer game" do
    GameTypeInterface.game_type(3)
    expect(GameTypeInterface.game_variety).to be_an_instance_of(TwoComputer)
  end

  it "shouldn't let you put in bad input for game_type" do
    expect { GameTypeInterface.verify_game_type(4) }.to raise_error(Errors::InputError)
  end

  it "should call player1 'you' in a SinglePlayer game" do
    GameTypeInterface.game_type(1)
    GameTypeInterface.game_variety
    puts GameTypeInterface.player_names
    expect(GameTypeInterface.name(:player1)).to eq("you")
  end
  
  it "should call player2 'the computer' in a SinglePlayer game" do
    GameTypeInterface.game_type(1)
    GameTypeInterface.game_variety
    puts GameTypeInterface.player_names
    expect(GameTypeInterface.name(:player2)).to eq("the computer")
  end
  
  it "should call player1 'the first human' in a SinglePlayer game" do
    GameTypeInterface.game_type(2)
    GameTypeInterface.game_variety
    puts GameTypeInterface.player_names
    expect(GameTypeInterface.name(:player1)).to eq("the first human")
  end
  
  it "should call player2 'the second human' in a SinglePlayer game" do
    GameTypeInterface.game_type(2)
    GameTypeInterface.game_variety
    puts GameTypeInterface.player_names
    expect(GameTypeInterface.name(:player2)).to eq("the second human")
  end
  
  it "should call player1 'the first computer' in a SinglePlayer game" do
    GameTypeInterface.game_type(3)
    GameTypeInterface.game_variety
    puts GameTypeInterface.player_names
    expect(GameTypeInterface.name(:player1)).to eq("the first computer")
  end
  
  it "should call player2 'the second computer' in a SinglePlayer game" do
    GameTypeInterface.game_type(3)
    GameTypeInterface.game_variety
    puts GameTypeInterface.player_names
    expect(GameTypeInterface.name(:player2)).to eq("the second computer")
  end

end

