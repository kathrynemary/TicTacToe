require_relative '../board'

describe Board do

  it "should have 9 spaces" do
    expect(Board.new.size).to be == 9
  end

end

describe Space do

  before :each do
    @x = Space.new(0)
  end

  it "status can be non-picked" do
    expect(@x.picked).to eq(false)
  end

  it "status can change to picked" do
    @x.pick
    expect(@x.picked).to eq(true)
  end

end
