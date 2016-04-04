require_relative '../game'

describe Game do

  before :each do
    allow(GameTypeInterface).to receive(:ask_game_type) {1}
    allow(SymbolInterface).to receive(:get_symbol).with(:player1) {"X"}
    allow(SymbolInterface).to receive(:get_symbol).with(:player2) {"O"}
    allow(OrderInterface).to receive(:first_player_answer) {"1"} 
    @example = Game.new
  end

   it "should summon an instance of board" do
     expect(@example.board.board.size).to eq(9)
   end

   it "should pick a space on the board" do 
    @example.pick(:first_player, 2)
    expect(@example.board.available_spaces).not_to include(2)
   end
   
   it "should show correct # avail spaces after a space is picked" do
     @example.pick(:player1, 2)
     expect(@example.board.available_spaces.size).to eq(8)
   end
 
   it "should identify a winner" do
     @example.pick(:player1, 0)
     @example.pick(:player1, 1)
     @example.pick(:player1, 2)
     expect(@example.board.winner?(:player1)).to eq(true)
   end
   
   it "should identify only the correct winner" do
     @example.pick(:player1, 0)
     @example.pick(:player1, 1)
     @example.pick(:player1, 2)
     expect(@example.board.winner?(:player2)).not_to eq(true)
   end

   it "should identify a tie" do
     @example.pick(:player1, 0)
     @example.pick(:player1, 1)
     @example.pick(:player1, 2)
     @example.pick(:player1, 3)
     @example.pick(:player1, 4)
     @example.pick(:player1, 5)
     @example.pick(:player1, 6)
     @example.pick(:player1, 7)
     @example.pick(:player1, 8)
     @example.board.winner?(:player1)
     expect(@example.board.tie?).to eq(true)
   end

   it "should pick spaces with the correct symbol" do 
     expect(@example.pick(:player1, 0)).to eq(Board.new.pick(:player1, 0))
   end
=begin
  it "should update the score after a win" do #this isn't working
     @example.pick(:player1, 0)
     @example.pick(:player1, 1)
     @example.pick(:player1, 2) 
     expect(player1.score).to eq(1) 
  end
=end
end
