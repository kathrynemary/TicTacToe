require_relative '../session'
require_relative '../interface'

describe Session do
  
  it "should ask what type of game to start" do
    allow(Interface).to receive(:game_type) {1}
    expect(Session.new).to eq(SinglePlayer.new)
  end	  

  it "should keep track of who won a game" do
    allow(Game).to receive(:game_over) {true}
    expect(Session.monitor_game).to #???
  end



end
