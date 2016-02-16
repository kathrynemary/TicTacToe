require_relative '../tictactoe'
require_relative '../player'
require_relative '../board'

describe Board do

  it "should have 3 lines" do
    expect(Board.new_board).to include("\n"){2}
  end

  it "should have 9 spaces total" do
    expect(Board.new_board).to match(/\d/){9}
  end

  it "should have dividers between each board space" do
    expect(Board.new_board).to include("|"){12}
  end

  it "should sub for x at a given spot" do #but iiiis this working?
    expect(Board.update("a", 4)).to include("a")
  end

    it "should update from previously changed version" do #ditto
      expect(Board.update("a", 5)).to include("a"){2}
    end

end
