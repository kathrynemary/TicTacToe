require_relative '../tictactoe'
require_relative '../player'
require_relative '../board'
require_relative '../game'


describe Game do

  it "should summon an instance of player" do
    expect(Game.new.player1.symbol).to eq(Player.new("X").symbol)
  end

  it "should summon an instance of board" do
    expect(Game.new.board.size).to eq(Board.new.size)
  end

end

describe Move do

  before :each do
    @x = Move.new
  end

  it "should pick a space on the board" do
    expect(@x.pick(2)).to eq(Space.new(2).pick)
  end


end
