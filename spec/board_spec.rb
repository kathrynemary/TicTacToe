require_relative '../board'

describe Board do

  before :each do
    @x = Board.new
  end

  it "should have 9 spaces" do
    expect(@x.board.size).to be == 9
  end

  it "should list available spaces" do
    expect(@x.available_spaces.size).to be == 9
  end

  it "should raise an error if an unavailable space is picked" do
    @x.pick('p', '1')
    expect { @x.pick('p', '1') }.to raise_error(Errors::InputError)
  end

  it "should identify when there is a winner" do
    @x.pick("e", '0')
    @x.pick("e", '1')
    @x.pick("e", '2')
    expect(@x.winner?("e")).to eq true
  end
 
  it "should identify a left, vertical column win" do
    @x.pick("e", '0')
    @x.pick("e", '3')
    @x.pick("e", '6')
    expect(@x.winner?("e")).to eq true
  end

  it "should identify when there is a diagonal winner" do
    @x.pick('l', '2')
    @x.pick('l', '4')
    @x.pick('l', '6')
    expect(@x.winner?('l')).to eq true
  end

  it "shouldn't say there's a winner if a row is full" do
    @x.pick('g', '0')
    @x.pick('g', '1')
    @x.pick('u', '2')
    expect(@x.winner?('g')).to eq false
  end

  it "should identify a tied game" do
    @x.pick('g', '0')
    @x.pick('h', '1')
    @x.pick('g', '2')
    @x.pick('h', '3')
    @x.pick('g', '4')
    @x.pick('h', '5')
    @x.pick('g', '6')
    @x.pick('h', '7')
    @x.pick('g', '8')
    expect(@x.winner?('g')).to eq(true)
  end

  it "should identify when a player picks a spot" do
    @x.pick('h', '2')
    expect(@x.available_spaces).not_to include(2)
  end

  it "should not call a win when 2 players make a row" do
    @x.pick("X", '2')
    @x.pick("y", '4')
    @x.pick("y", '6')
    expect(@x.winner?("y")).to eq false
  end

end
