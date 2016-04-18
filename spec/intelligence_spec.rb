require_relative '../intelligence.rb'

describe Intelligence do

  before :each do
    @x = Board.new
  end

  it "should not play over a taken space" do
    @x.pick("P", '4')
    test = Intelligence.new("K", "K", "P", @x)
		expect(test.choose_move).not_to eq('4')
  end

	it "should pick the third to complete the first row" do
    @x.pick("y", "0")
    @x.pick("y", "1")
		test = Intelligence.new("y", "y", "u", @x)
    expect(test.choose_move).to eq('2')
	end

  it "should pick the third to complete the second row" do
    @x.pick("y", '3')
    @x.pick("y", '4')
		test = Intelligence.new("y", "y", "j", @x)
    expect(test.choose_move).to eq('5')
  end

  it "should pick the third to complete the third row" do
    @x.pick("y", '6')
    @x.pick("y", '7')
    test = Intelligence.new("y", "y", "h", @x)
		expect(test.choose_move).to eq('8')
  end

  it "should complete a diagonal match" do
    @x.pick("y", '0')
    @x.pick("y", '8')
		test = Intelligence.new("y", "y", "k", @x)
    expect(test.choose_move).to eq('4')
  end

  it "should complete a vertical match" do
    @x.pick("y", '1')
    @x.pick("y", '7')
		test = Intelligence.new("y", "y", "j", @x)
    expect(test.choose_move).to eq('4')
  end

  it "should complete the third row to win, rather than the 2nd row to avoid a loss" do
    @x.pick("g", '3')
    @x.pick("g", '4')
    @x.pick("y", '6')
    @x.pick("y", '7')
    test = Intelligence.new("y", "y", "g", @x)
		expect(test.choose_move).to eq('8')
  end

  it "should complete the first row to win, rather than the 3rd row to avoid a loss" do
    @x.pick("g", '6')
    @x.pick("g", '8')
    @x.pick("y", '0')
    @x.pick("y", '2')
    test = Intelligence.new("y", "y", "g", @x)
		expect(test.choose_move).to eq('1')
  end
  
	it "should complete the second row to win, rather than the 1st row to avoid a loss" do
    @x.pick("g", '0')
    @x.pick("g", '1')
    @x.pick("y", '4')
    @x.pick("y", '5')
		test = Intelligence.new("y", "y", "g", @x)
    expect(test.choose_move).to eq('3')
  end

	it "should complete the 1st column to win, rather than 2nd column to avoid a loss" do
    @x.pick("g", '1')
    @x.pick("g", '4')
    @x.pick("y", '0')
    @x.pick("y", '3')
		test = Intelligence.new("y", "y", "g", @x)
    expect(test.choose_move).to eq('6')
  end	
	
	it "should complete the 2nd column to win, rather than 3rd column to avoid a loss" do
    @x.pick("g", '8')
    @x.pick("g", '2')
    @x.pick("y", '1')
    @x.pick("y", '4')
		test = Intelligence.new("y", "y", "g", @x)
    expect(test.choose_move).to eq('7')
  end
	
	it "should complete the 3rd column to win, rather than 1st column to avoid a loss" do
    @x.pick("g", '0')
    @x.pick("g", '3')
    @x.pick("y", '8')
    @x.pick("y", '5')
		test = Intelligence.new("y", "y", "g", @x)
    expect(test.choose_move).to eq('2')
  end
	
	it "should complete the descending diagonal to win, rather than avoid a loss" do
    @x.pick("g", '5')
    @x.pick("g", '2')
    @x.pick("y", '4')
    @x.pick("y", '0')
		test = Intelligence.new("y", "y", "g", @x)
    expect(test.choose_move).to eq('8')
  end
	
	it "should complete the ascending diagonal to win, rather than avoid a loss" do
    @x.pick("g", '0')
    @x.pick("g", '1')
    @x.pick("y", '4')
    @x.pick("y", '2')
    test = Intelligence.new("y", "y", "g", @x)
		expect(test.choose_move).to eq('6')
  end

	it "should do choose a space given little input" do
    @x.pick("g", '0')
    test = Intelligence.new("y", "y", "g", @x)
		valid_moves = ['1', '2', '3', '4', '5', '6', '7', '8']
		expect(valid_moves).to include(test.choose_move)	
  end
	
	it "should do choose a space given little input" do
    @x.pick("g", '8')
    test = Intelligence.new("y", "y", "g", @x)
		valid_moves = ['0', '1', '2', '3', '4', '5', '6', '7']
		expect(valid_moves).to include(test.choose_move)	
  end
	
	it "should prevent an ascending diagonal win" do
    @x.pick("g", '6')
		@x.pick("y", '1')
    @x.pick("g", '4')
    test = Intelligence.new("y", "y", "g", @x)
		expect(test.choose_move).to eq('2')	
  end
	
	it "should prevent a descending diagonal win" do
    @x.pick("g", '2')
		@x.pick("y", '0')
    @x.pick("g", '4')
    test = Intelligence.new("y", "y", "g", @x)
		expect(test.choose_move).to eq('6')	
  end
	
	it "should prevent a vertical win" do
    @x.pick("g", '1')
		@x.pick("y", '0')
    @x.pick("g", '7')
    test = Intelligence.new("y", "y", "g", @x)
		expect(test.choose_move).to eq('4')	
  end

	it "should prevent a horizontal win" do
    @x.pick("g", '3')
		@x.pick("y", '0')
    @x.pick("g", '5')
    test = Intelligence.new("y", "y", "g", @x)
		expect(test.choose_move).to eq('4')	
  end
	
	it "should do choose a space given little input" do
    @x.pick("g", '0')
		@x.pick("y", '3')
    @x.pick("g", '6')
    test = Intelligence.new("y", "y", "g", @x)
		valid_moves = ['1', '2', '4', '5', '7', '8']
		expect(valid_moves).to include(test.choose_move)	
  end

end
