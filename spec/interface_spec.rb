require_relative '../Interface/interface'

describe Interface do

  it "should display the board" do
    a = Board.new.board
    expect(Interface.display_board(a)).to include("0", "1", "2", "3", "4", "5", "6", "7", "8")
  end

  it "should display the update when a space is taken" do
    allow(Interface).to receive(:ask_symbol) { "X" }
    a = Board.new.pick(:player1, 1)
    expect(Interface.display_board(a)).to include("0", "player1", "2", "3", "4", "5", "6", "7", "8")
  end

end
