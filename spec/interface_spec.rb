require_relative '../board'
require_relative '../game'
require_relative '../player'
require_relative '../interface'

describe Interface do

  it "should ask for input to select a player's symbol" do
    @x = Interface.new.ask_symbol("k")
    allow(@x).to receive(:get_symbol) {"X"}
    expect(@x.symbol).to eql("X")
  end

end
