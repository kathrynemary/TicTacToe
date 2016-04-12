# move_position = PerfectAI.new(current_board).determine_move
#will eventually need to distinguish between the 2 players' moves. That could live elsewhere maybe?

require_relative '../intelligence.rb'
require_relative '../game.rb'
require_relative '../board.rb'

describe Intelligence do

  before :each do
    @x = Board.new
  end

  it "should pick the middle space if it is available" do
    expect(Intelligence.choose_move("r", @x)).to eq('4')
  end

  it "should not pick 4 when 4 is already taken" do
    @x.pick("P", '4')
    expect(Intelligence.choose_move("K", @x)).not_to eq('4')
  end

  it "should pick the third to complete the first row" do
    @x.pick("y", "0")
    @x.pick("y", "1")
    expect(Intelligence.choose_move("y", @x)).to eq('2')
  end

  it "should pick the third to complete the second row" do
    @x.pick("y", '3')
    @x.pick("y", '4')
    expect(Intelligence.choose_move("y", @x)).to eq('5')
  end

  it "should pick the third to complete the third row" do
    @x.pick("y", '6')
    @x.pick("y", '7')
    expect(Intelligence.choose_move("y", @x)).to eq('8')
  end

  it "should complete a diagonal match" do
    @x.pick("y", '0')
    @x.pick("y", '8')
    expect(Intelligence.choose_move("y", @x)).to eq('4')
  end

  it "should complete a vertical match" do
    @x.pick("y", '1')
    @x.pick("y", '7')
    expect(Intelligence.choose_move("y", @x)).to eq('4')
  end

  it "should pick an available spot if middle is taken" do
    @x.pick("y", '4')
    expect(Intelligence.choose_move("y", @x)).to eq('0')
	end

  it "should complete the third row to win, rather than the 2nd row to avoid a loss" do
    @x.pick("g", '3')
    @x.pick("g", '4')
    @x.pick("y", '6')
    @x.pick("y", '7')
    expect(Intelligence.choose_move("y", @x)).to eq('8')
  end

end
