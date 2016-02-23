require_relative '../computer'
require_relative '../player'
require_relative '../game'

describe Computer do

  it "should return a symbol for the computer" do
    expect(Computer.new("X").symbol).to eq("X")
  end

end


#if the player is an instance of computer, invoke unbeatable-rules for its moves


#minimacs to make unbeatable
#in game, just say if the player is an instance of computer use unbeatable method
#tell it to alternate "picking" between players
