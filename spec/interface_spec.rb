require_relative '../interface'

describe Interface do

  it "should ask for input to select a player's symbol" do
    allow(Interface).to receive(:get_symbol) { "X" }
    expect(Interface.ask_symbol("k")).to eql("X")
  end

  it "should ensure the symbol is not a number" do
    allow(Interface).to receive(:get_symbol) { "X" }
    expect(Interface.ask_symbol("J")).to match(/\A[a-zA-Z]{1}\z/)
  end
#I feel like this test is not sufficient.

  it "should get the first player" do
    allow(Interface).to receive(:get_order) {1}
    expect(Interface.determine_order).to eql(:player1)
  end

  it "should display the board" do
    a = Board.new.board
    expect(Interface.display_board(a)).to include("0", "1", "2", "3", "4", "5", "6", "7", "8")
  end

  it "should display the update when a space is taken" do
    a = Board.new.pick("X", 1)
    expect(Interface.display_board(a)).to include("0", "X", "2", "3", "4", "5", "6", "7", "8")
  end

  it "should have a name for each player" do
    expect(Interface.name(:player1)).to eq("first player")
    expect(Interface.name(:player2)).to eq("second player")
  end

end
