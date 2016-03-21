require_relative '../player'
require_relative '../board'
require_relative '../game'
require_relative '../computer'
require_relative '../Intelligence'


describe Game do

  before :each do
    allow(Interface).to receive(:ask_game_type) {"Single Player"}
    allow(Interface).to receive(:ask_symbol) {"X"}
    allow(Interface).to receive(:first_player) {player1}
    allow(Interface).to receive(:order_input) {1} 
  end

   it "should summon an instance of board" do
     expect(Game.new.board.board.size).to eq(Board.new.board.size)
   end

   it "should pick a space on the board" do
    y = Game.new
    y.pick(:player1, 2)
    expect(y.board.available_spaces).not_to include(2)
   end
 
   it "should show correct # avail spaces after a space is picked" do
     y = Game.new
     y.pick(:player1, 2)
     expect(y.board.available_spaces).not_to include(2)
   end
 
   it "should identify a winner" do
     y = Game.new
     y.pick(:player1, 0)
     y.pick(:player1, 1)
     y.pick(:player1, 2)
     expect(y.board.winner?(:player1)).to eq(true)
   end

   it "should identify a tie" do
     x = Game.new
     x.board.pick(:player1, 0)
     x.board.pick(:player1, 1)
     x.board.pick(:player1, 2)
     x.board.pick(:player1, 3)
     x.board.pick(:player1, 4)
     x.board.pick(:player1, 5)
     x.board.pick(:player1, 6)
     x.board.pick(:player1, 7)
     x.board.pick(:player1, 8)
     x.board.winner?(:player1)
     expect(x.board.tie?).to eq(true)
   end

   it "should pick spaces with the correct symbol" do 
     expect(Game.new.pick(:player1, 0)).to eq(Board.new.pick(:player1, 0))
   end

  
  it "should complete a vertical match" do
    example = Game.new
    example.pick(:player1, 1)
    example.pick(:player1, 7)
    expect(Intelligence.choose_move(example.board)).to eq(4)
  end

end
