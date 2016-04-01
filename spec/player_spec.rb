require_relative '../player'

describe Player do

  it "should return a symbol for the player" do
    expect(Player.new("X").symbol).to eq("X")
  end

  it "should allow a different symbol for another player" do
    expect(Player.new("Z").symbol).to eq("Z")
  end

  it "should return the score" do
    expect(Player.score).to eq(0)
  end

  it "should update the score twice" do
    Player.update_score
    Player.update_score
    expect(Player.score).to eq(2) 
  end

end
