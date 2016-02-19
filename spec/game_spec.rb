require_relative '../tictactoe'
require_relative '../player'
require_relative '../board'
require_relative '../game'


describe Game do

  before :each do
    @x = Game.new
  end

  it "should summon an instance of player" do
    expect(@x.player1.symbol).to eq(Player.new("X").symbol)
  end

  it "should summon an instance of board" do
    expect(@x.board.board.size).to eq(Board.new.board.size)
  end

  it "should pick a space on the board" do
    expect(@x.board.pick(2)).to eq(Board.new.pick(2))
  end

  it "should show correct # avail spaces after a space is picked" do
    @x.board.pick(2)
    expect(@x.board.available_spaces).not_to include(2)
  end

  it "should identify a winner" do
    @x.board.pick(0)
    @x.board.pick(1)
    @x.board.pick(2)
    expect(@x.board.status).to eq("win")
  end

  it "should identify a tie" do
    @x.board.pick(0)
    @x.board.pick(1)
    @x.board.pick(2)
    @x.board.pick(3)
    @x.board.pick(4)
    @x.board.pick(5)
    @x.board.pick(6)
    @x.board.pick(7)
    @x.board.pick(8)
    expect(@x.board.status).to eq("tie")
  end

end
