require_relative '../tictactoe'

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

  it "should sub for x at a given spot" do
    expect(Board.update("a", 4)).to include("a")
  end

    it "should update from previously changed version" do
      expect(Board.update("a", 5)).to include("a"){2}
    end

end

describe Player do

  before :each do
    @x = Player.new
  end

  it "should have 2 players" do #also checks their symbol... will need to change this eventually.
    expect(@x.instance_variable_get("@player1")).to eq("X")
    expect(@x.instance_variable_get("@player2")).to eq("O")
  end

  # it "shouldn't have the 2 symbols match" do
  #   expect(x.instance_variable_get)
  # end




end
