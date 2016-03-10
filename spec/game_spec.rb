require_relative '../player'
require_relative '../board'
require_relative '../game'
require_relative '../computer'
require_relative '../Intelligence'


describe Game do

  before :each do
    @x = Game.new
  end

   it "should summon an instance of board" do
     expect(@x.board.board.size).to eq(Board.new.board.size)
   end
  
   it "should pick a space on the board" do
     expect(@x.board.pick("t", 2)).to eq(Board.new.pick("t", 2))
   end
  
   it "should show correct # avail spaces after a space is picked" do
     @x.board.pick("t", 2)
     expect(@x.board.available_spaces).not_to include(2)
   end
  
   it "should identify a winner" do
     @x.board.pick("t", 0)
     @x.board.pick("t", 1)
     @x.board.pick("t", 2)
     expect(@x.board.winner?("t")).to eq(true)
   end
  
   it "should identify a tie" do
     @x.board.pick("t", 0)
     @x.board.pick("t", 1)
     @x.board.pick("t", 2)
     @x.board.pick("t", 3)
     @x.board.pick("t", 4)
     @x.board.pick("t", 5)
     @x.board.pick("t", 6)
     @x.board.pick("t", 7)
     @x.board.pick("t", 8)
     expect(@x.board.winner?("t")).to eq("tie")
   end
  
   it "should pick spaces with the correct symbol" do
     expect(@x.pick(@x.player1.symbol, 0)).to eq(Board.new.pick("X", 0))
   end
  
   it "should have an option to play with 1 player, 1 computer" do
     expect(@x.setup("Single Player")).to be_an_instance_of(SinglePlayer)
   end
  
   it "should have an option to play with 2 human players" do
     expect(@x.setup("Two Player")).to be_an_instance_of(TwoPlayer)
   end
  
   it "should have an option to play with 2 computers" do
     expect(@x.setup("Two Computer")).to be_an_instance_of(TwoComputer)
   end
  
   it "should complete a vertical match" do
       @x.pick("y", 1)
       @x.pick("y", 7)
       expect(Intelligence.choose_move(@x.board)).to eq(4)
   end

end

 describe TwoComputer do

   before :each do
     @y = TwoComputer.new
   end

   it "should have player1 be a computer" do
     expect(@y.player1).to be_an_instance_of(Computer)
   end
 
  it "should have player2 be a computer" do
     expect(@y.player2).to be_an_instance_of(Computer)
   end

 end

 describe TwoPlayer do

   before :each do
     @y = TwoPlayer.new
   end

   it "should have player1 not be a computer" do
     expect(@y.player1).to_not be_an_instance_of(Computer)
   end

   it "should have player2 not be a computer" do
     expect(@y.player2).to_not be_an_instance_of(Computer)
   end

 end

 describe SinglePlayer do

   before :each do
     @y = SinglePlayer.new
   end

   it "should have player1 not be a computer" do
     expect(@y.player1).to_not be_an_instance_of(Computer)
   end

   it "should have player2 be a computer" do
     expect(@y.player2).to be_an_instance_of(Computer)
   end

 end
