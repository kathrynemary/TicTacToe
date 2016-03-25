require_relative '../session'
require_relative '../Interface/display_board_interface'

describe Session do
=begin  
  it "should ask what type of game to start" do
    example = Session.new
    allow(example.game).to receive(:ask_game_type) {1}
    allow(Interface).to receive(:verify_game_type) {1}
    expect(Session.game).to be_an_instance_of(SinglePlayer)
  end	  

  it "should keep track of who won a game" do
    allow(Game).to receive(:game_over) {true}
    expect(Session.monitor_game).to #???
  end
=end
end
