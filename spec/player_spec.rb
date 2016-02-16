require_relative '../tictactoe'
require_relative '../player'
require_relative '../board'

describe Player do

  before :each do
    @x = Player.new
  end

  it "should have 2 players" do #also checks their symbol... will need to change this eventually.
    expect(@x.instance_variable_get("@player1")).to eq("X")
    expect(@x.instance_variable_get("@player2")).to eq("O")
  end

  it "shouldn't have the 2 symbols match" do
    expect(@x.instance_variable_get("@player1")).not_to eql(@x.instance_variable_get("@player2"))
  end


end
