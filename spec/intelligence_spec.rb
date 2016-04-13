require_relative '../intelligence.rb'
require_relative '../board.rb'

describe Intelligence do

  before :each do
    @x = Board.new
  end
=begin
  it "should pick the middle space if it is available" do
    expect(Intelligence.choose_move("r", @x)).to eq('4')
  end
=end
  it "should not pick 4 when 4 is already taken" do
    @x.pick("P", '4')
    expect(Intelligence.choose_move("K", @x)).not_to eq('4')
  end
=begin
  it "should pick the third to complete the first row" do
    @x.pick("y", "0")
    @x.pick("y", "1")
    expect(Intelligence.choose_move("y", @x)).to eq('2')
  end
=begin
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

  it "should complete the first row to win, rather than the 3rd row to avoid a loss" do
    @x.pick("g", '6')
    @x.pick("g", '8')
    @x.pick("y", '0')
    @x.pick("y", '2')
    expect(Intelligence.choose_move("y", @x)).to eq('1')
  end
  
	it "should complete the second row to win, rather than the 1st row to avoid a loss" do
    @x.pick("g", '0')
    @x.pick("g", '1')
    @x.pick("y", '4')
    @x.pick("y", '5')
    expect(Intelligence.choose_move("y", @x)).to eq('3')
  end

	it "should complete the 1st column to win, rather than 2nd col to avoid a loss" do
    @x.pick("g", '1')
    @x.pick("g", '4')
    @x.pick("y", '0')
    @x.pick("y", '3')
    expect(Intelligence.choose_move("y", @x)).to eq('6')
  end	
	
	it "should complete the 2nd column to win, rather than 3rd column to avoid a loss" do
    @x.pick("g", '8')
    @x.pick("g", '2')
    @x.pick("y", '1')
    @x.pick("y", '4')
    expect(Intelligence.choose_move("y", @x)).to eq('7')
  end
	
	it "should complete the 3rd column to win, rather than 1st column to avoid a loss" do
    @x.pick("g", '0')
    @x.pick("g", '3')
    @x.pick("y", '8')
    @x.pick("y", '5')
    expect(Intelligence.choose_move("y", @x)).to eq('2')
  end
	
	it "should complete the descending diagonal to win, rather than avoid a loss" do
    @x.pick("g", '5')
    @x.pick("g", '2')
    @x.pick("y", '4')
    @x.pick("y", '0')
    expect(Intelligence.choose_move("y", @x)).to eq('8')
  end
	
	it "should complete the ascending diagonal to win, rather than avoid a loss" do
    @x.pick("g", '0')
    @x.pick("g", '1')
    @x.pick("y", '4')
    @x.pick("y", '2')
    expect(Intelligence.choose_move("y", @x)).to eq('6')
  end
=end
end
