require_relative '../game'

describe Game do

	context "it plays the game correctly" do
		before :each do
			@example = Game.new
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
  end

  context "it uses Intelligence correctly" do
    before :each do
			@example = Game.new
			allow(@example).to receive(:first_player_symbol) {"X"}
			allow(@example).to receive(:second_player_symbol) {"O"}
		  allow(@example).to receive(:get_other_player).with("O") {"X"}
		  allow(@example).to receive(:get_other_player).with("X") {"O"}
		end
		
		it "should pick the third to complete a row" do
			@example.board.pick("O", '0')
			@example.board.pick("O", '1')
			@example.computer_turn("O")
			expect(@example.board.available_spaces).not_to include("2")
		end
		
		it "should complete a horizontal row to prevent a loss" do
			@example.board.pick("X", '3')
			@example.board.pick("X", '4')
			@example.computer_turn("O")
			expect(@example.board.available_spaces).not_to include("5")
	  end

	it "should complete a horizontal row to win" do
			@example.board.pick("X", '6')
			@example.board.pick("X", '7')
			@example.computer_turn("X") 
			expect(@example.board.available_spaces).not_to include("8")
		end

		it "should complete a diagonal match to complete a win" do
			@example.board.pick("O", '0')
			@example.board.pick("O", '8')
			@example.computer_turn("O")
			expect(@example.board.available_spaces).not_to include("4")
		end

		it "should complete a diagonal match to prevent a loss" do
			@example.board.pick("X", '0')
			@example.board.pick("X", '8')
			@example.computer_turn("O")
			expect(@example.board.available_spaces).not_to include("4")
		end
		it "should complete a vertical match to allow a win" do
			@example.board.pick("X", '1')
			@example.board.pick("X", '7')
			@example.computer_turn("X")
			expect(@example.board.available_spaces).not_to include("4")
		end
		
		it "should complete a vertical match to prevent a loss" do
			@example.board.pick("X", '1')
			@example.board.pick("X", '7')
			@example.computer_turn("O")
			expect(@example.board.available_spaces).not_to include("4")
		end		
  end

end

