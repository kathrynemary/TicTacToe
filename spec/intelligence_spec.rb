# move_position = PerfectAI.new(current_board).determine_move
#pass in an instance of board
#for current board, return best move

require_relative '../intelligence.rb'
require_relative '../game.rb'
require_relative '../board.rb'

describe Intelligence do

  before :each do
    @x = Board.new
  end

  it "should pick the middle space if it is available" do
    expect(Intelligence.choose_move(@x)).to eq(4)
  end

  it "should not pick 4 when 4 is already taken" do
    @x.pick("P", 4)
    expect(Intelligence.choose_move(@x)).not_to eq(4)
  end

  it "should pick the third to complete a row" do
    @x.pick("y", 0)
    @x.pick("y", 1)
    expect(Intelligence.choose_move(@x)).to eq(2)
  end

end
