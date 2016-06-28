require 'spec_helper'

describe DisplayBoardInterface do

  before :each do
    @example = Board.new
	end

  it "should display the board" do
    expect(DisplayBoardInterface.display_board(@example.board)).to include("0", "1", "2", "3", "4", "5", "6", "7", "8")
  end

  it "should display the update when a space is taken" do
		@example.pick("X", '1')
    expect(DisplayBoardInterface.display_board(@example.board)).not_to include("1")
  end

end
