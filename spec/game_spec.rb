require_relative '../game'
=begin
describe Game do

  before :each do
    allow(GameTypeInterface).to receive(:ask_game_type) {1}
    allow(SymbolInterface).to receive(:get_symbol).with(:player1) {"X"}
    allow(SymbolInterface).to receive(:get_symbol).with(:player2) {"O"}
    @example = Game.new
  end

   it "should summon an instance of board" do
     expect(@example.board.board.size).to eq(9)
   end

   it "should pick a space on the board" do 
    @example.board.pick('d', '2')
    expect(@example.board.available_spaces).not_to include('2')
   end

   it "should show correct # avail spaces after a space is picked" do
     @example.board.pick('d', '2')
     expect(@example.board.available_spaces.size).to eq(8)
   end
 
   it "should identify a winner" do
     @example.board.pick('d', '0')
     @example.board.pick('d', '1')
     @example.board.pick('d', '2')
     expect(@example.board.winner?('d')).to eq(true)
   end
 
   it "should identify only the correct winner" do
     @example.board.pick('d', '0')
     @example.board.pick('k', '1')
     @example.board.pick('d', '2')
     expect(@example.board.winner?('d')).not_to eq(true)
   end

   it "should identify a tie" do
     @example.board.pick('d', '0')
     @example.board.pick('d', '1')
     @example.board.pick('d', '2')
     @example.board.pick('d', '3')
     @example.board.pick('d', '4')
     @example.board.pick('d', '5')
     @example.board.pick('d', '6')
     @example.board.pick('d', '7')
     @example.board.pick('d', '8')
     @example.board.winner?('d')
     expect(@example.board.tie?).to eq(true)
   end

   it "should pick spaces with the correct symbol" do 
     expect(@example.board.pick('d', '0')).to eq(Board.new.pick('d', '0'))
   end

end
=end
describe Game do

  before :each do
    allow(GameTypeInterface).to receive(:ask_game_type) {3}
    allow(SymbolInterface).to receive(:get_symbol).with(:player1) {"X"}
    allow(SymbolInterface).to receive(:get_symbol).with(:player2) {"O"}
    @example = Game.new
  end

  it "should reference Intelligence for a Computer player" do
    @example.play_a_turn(@first_player_symbol) 
    expect(@example.board.available_spaces).not_to include('4')
  end

  it "should pick the third to complete a row" do
    @example.board.pick("y", '0')
    @example.board.pick("y", '1')
    @example.play_a_turn("y")
    expect(@example.board.available_spaces).not_to include("2")
  end

  it "should pick the third to complete the second row" do
    @example.board.pick("y", '3')
    @example.board.pick("y", '4')
    @example.play_a_turn("y")
    expect(@example.board.available_spaces).not_to include("5")
  end

  it "should pick the third to complete the third row" do
    @example.board.pick("y", '6')
    @example.board.pick("y", '7')
    @example.play_a_turn("y") 
    expect(@example.board.available_spaces).not_to include("8")
  end

  it "should complete a diagonal match" do
    @example.board.pick("y", '0')
    @example.board.pick("y", '8')
    @example.play_a_turn("y")
    expect(@example.board.available_spaces).not_to include("4")
  end

  it "should complete a vertical match" do
    @example.board.pick("y", '1')
    @example.board.pick("y", '7')
    @example.play_a_turn("y")
    expect(@example.board.available_spaces).not_to include("4")
  end

  it "should complete a vertical match" do
    @example.board.pick("g", '1')
    @example.board.pick("g", '7')
    @example.play_a_turn("y")
    expect(@example.board.available_spaces).not_to include("4")
  end
end

