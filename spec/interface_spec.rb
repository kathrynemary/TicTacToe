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
=begin
  it "should get the first player" do
    allow(Interface).to receive(:get_order) {:player1}
    expect(Interface.determine_order).to eql(:player1)
  end
=end
  it "should display the board" do
    a = Board.new.board
    expect(Interface.display_board(a)).to include("0", "1", "2", "3", "4", "5", "6", "7", "8")
  end

  it "should display the update when a space is taken" do
    allow(Interface).to receive(:ask_symbol) { "X" }
    a = Board.new.pick(:player1, 1)
    expect(Interface.display_board(a)).to include("0", "X", "2", "3", "4", "5", "6", "7", "8")
  end
=begin
  #this isn't working... i'll come back to it.
  it "should have a name for each player in 2-player" do
    y = TwoPlayer.new
	  
    expect(Interface.name(:player1)).to eq("first human")
    expect(Interface.name(:player2)).to eq("second human")
  end

  it "should have a name for each player in a 1-player game" do
    x = SinglePlayer.new
     
    expect(Interface.name(:player1)).to eq("you")
    expect(Interface.name(:player2)).to eq("the computer")
  end
=end
end
