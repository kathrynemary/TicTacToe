require_relative '../board'

describe Board do

  before :each do
    @x = Board.new
  end

  it "should have 9 spaces" do
    expect(@x.board.size).to be == 9
  end

  it "should list available spaces" do
    expect(@x.available_spaces.size).to be == 9
  end

  it "should take an item out of available when it is picked" do
    @x.pick("y", 1)
    expect(@x.available_spaces.size).to be == 8
  end

  it "should know the location of the unavailable space" do
    @x.pick("y", 1)
    expect(@x.available_spaces).not_to include(1)
  end

  it "should identify when there is a winner" do
    @x.pick("y", 0)
    @x.pick("y", 1)
    @x.pick("y", 2)
    expect(@x.winner?("y")).to eq true
  end

  it "should identify when there is a diagonal winner" do
    @x.pick("y", 2)
    @x.pick("y", 4)
    @x.pick("y", 6)
    expect(@x.winner?("y")).to eq true
  end

  it "should identify a tied game" do
    @x.pick("y", 0)
    @x.pick("y", 1)
    @x.pick("y", 2)
    @x.pick("y", 3)
    @x.pick("y", 4)
    @x.pick("y", 5)
    @x.pick("y", 6)
    @x.pick("y", 7)
    @x.pick("y", 8)
    expect(@x.winner?("y")).to eq("tie")
  end

  it "should identify when a player picks a spot" do
    @x.pick("X", 2)
    expect(@x.available_spaces).not_to include(2)
  end

  it "should not call a win when 2 players make a row" do
    @x.pick("X", 2)
    @x.pick("y", 4)
    @x.pick("y", 6)
    expect(@x.winner?("y")).to eq false
  end

end
