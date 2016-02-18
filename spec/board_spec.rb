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
    @x.pick(1)
    expect(@x.available_spaces.size).to be == 8
  end

  it "should know the location of the unavailable space" do
    @x.pick(1)
    expect(@x.available_spaces).not_to include(1)
  end


end
