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

  it "should know the location of the unavailable space" do
    @x.pick(:player1, 1)
    expect(@x.available_spaces).not_to include(1)
  end

  it "should identify when there is a winner" do
    @x.pick(:player1, 0)
    @x.pick(:player1, 1)
    @x.pick(:player1, 2)
    expect(@x.winner?(:player1)).to eq true
  end

  it "should identify when there is a diagonal winner" do
    @x.pick(:player1, 2)
    @x.pick(:player1, 4)
    @x.pick(:player1, 6)
    expect(@x.winner?(:player1)).to eq true
  end

  it "shouldn't say there's a winner if a row is full" do
    @x.pick(:player1, 0)
    @x.pick(:player2, 1)
    @x.pick(:player1, 2)
    expect(@x.winner?(:player1)).to eq false
  end

  it "should identify a tied game" do
    @x.pick(:player1, 0)
    @x.pick(:player1, 1)
    @x.pick(:player1, 2)
    @x.pick(:player1, 3)
    @x.pick(:player1, 4)
    @x.pick(:player1, 5)
    @x.pick(:player1, 6)
    @x.pick(:player1, 7)
    @x.pick(:player1, 8)
    expect(@x.winner?(:player1)).to eq("tie")
  end

  it "should identify when a player picks a spot" do
    @x.pick(:player1, 2)
    expect(@x.available_spaces).not_to include(2)
  end

  it "should not call a win when 2 players make a row" do
    @x.pick("X", 2)
    @x.pick("y", 4)
    @x.pick("y", 6)
    expect(@x.winner?("y")).to eq false
  end

  it "should not allow you to pick the same space twice" do
    @x.pick("X", 1)
    expect(@x.pick("O", 1)).to eq("Error!")
  end

end
