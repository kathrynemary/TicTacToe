require_relative '../session'
require_relative '../Interface/display_board_interface'

describe Session do

  before :each do
    allow(GameTypeInterface).to receive(:ask_game_type) {1}
    allow(SymbolInterface).to receive(:get_symbol).with(:player1) {"X"}
    allow(SymbolInterface).to receive(:get_symbol).with(:player2) {"O"}
    allow(OrderInterface).to receive(:first_player_answer) {"1"} 
    @example = Session.new
  end

  it "shouldn't let you put in bad input for a new game" do
    expect { Session.check_input("4") }.to raise_error(Errors::InputError)
  end
  
  it "shouldn't let you put in bad input for a new game" do
    expect { Session.check_input("11") }.to raise_error(Errors::InputError)
  end
  
end

#keeping track of the score
#exit_session works?

