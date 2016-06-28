require 'spec_helper'

describe GameTypeInterface do
  
  it "should run through getting the game type with the 'run' method" do
    allow(GameTypeInterface).to receive(:ask_game_type) {1} 
    game_type = [SinglePlayer]
		expect(game_type).to include(GameTypeInterface.run)
  end
  
  it "should run through getting the game type with the 'run' method" do
    allow(GameTypeInterface).to receive(:ask_game_type) {2} 
    game_type = [TwoPlayer]
		expect(game_type).to include(GameTypeInterface.run)
  end
  
  it "should run through getting the game type with the 'run' method" do
    allow(GameTypeInterface).to receive(:ask_game_type) {3} 
    game_type = [TwoComputer]
		expect(game_type).to include(GameTypeInterface.run)
  end

  it "shouldn't let you put in bad input for game_type" do
    expect { GameTypeInterface.verify_game_type(4) }.to raise_error(Errors::UserError)
  end
end

