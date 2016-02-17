require_relative '../player'

describe Player do

  it "should return a symbol for the player" do
    expect(Player.new("X").symbol).to eq("X")
  end

  it "should allow a different symbol for another player" do
    expect(Player.new("Z").symbol).to eq("Z")
  end

end
