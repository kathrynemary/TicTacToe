require_relative '../player'

describe Player do

=begin
  it "should return a symbol for the player" do
    expect(Player.new("X").symbol).to eq("X")
  end

  it "should allow a different symbol for another player" do
    expect(Player.new("Z").symbol).to eq("Z")
  end
=end

  it "should return the score" do
    expect(Player.new.score).to eq(0)
  end

  it "should update the score twice" do
    example = Player.new
    example.update_score
    example.update_score
    expect(example.score).to eq(2) 
  end

end
