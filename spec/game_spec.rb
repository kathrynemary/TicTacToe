require_relative '../game'

describe Game do

	context "it is a single-player game" do
		before :each do
			allow(GameTypeInterface).to receive(:ask_game_type) {2}
		  allow(OrderInterface).to receive(:ask_first_player) {:player1}
			allow(SymbolInterface).to receive(:ask_symbol).with(:player1) {"X"}
			allow(SymbolInterface).to receive(:ask_symbol).with(:player2) {"O"}
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

  context"it has a 2-computer game" do #these are all failing!
    before :each do
			#allow(GameTypeInterface).to receive(:game_type) {TwoComputer}
		  allow(Game).to receive(:player_type) {Computer}
			allow(OrderInterface).to receive(:ask_first_player) {:player1}
			allow(SymbolInterface).to receive(:ask_symbol).with(:player1) {"X"}
			allow(SymbolInterface).to receive(:ask_symbol).with(:player2) {"O"}
			@example = Game.new
		end
		
		it "should reference Intelligence for a Computer player" do
			@example.board.pick("O", "4")
			@example.play_a_turn(@first_player_symbol) 
			expect(@example.board.available_spaces).not_to include('4')
		end

		it "should pick the third to complete a row" do
			@example.board.pick("y", '0')
			@example.board.pick("y", '1')
			@example.play_a_turn("y")
			expect(@example.board.available_spaces).not_to include("2")
		end
    #this doesn't work
		#it "should complete a horizontal row to prevent a loss" do
		#	@example.board.pick("X", '3')
		#	@example.board.pick("X", '4')
		#	@example.play_a_turn("O")
		#	expect(@example.board.available_spaces).not_to include("5")
		#end

	it "should complete a horizontal row to win" do
			@example.board.pick("X", '6')
			@example.board.pick("X", '7')
			@example.play_a_turn("X") 
			expect(@example.board.available_spaces).not_to include("8")
		end

		it "should complete a diagonal match to complete a winn" do
			@example.board.pick("O", '0')
			@example.board.pick("O", '8')
			@example.play_a_turn("O")
			expect(@example.board.available_spaces).not_to include("4")
		end

		it "should complete a vertical match to allow a win" do
			@example.board.pick("X", '1')
			@example.board.pick("X", '7')
			@example.play_a_turn("X")
			expect(@example.board.available_spaces).not_to include("4")
		end
   ###***********
		it "should complete a vertical match to prevent a loss" do
			@example.board.pick("X", '1')
			@example.board.pick("X", '7')
			@example.play_a_turn("O")
			expect(@example.board.available_spaces).not_to include("4")
		end
  end
  ###*********
	context"it has a 2-player game" do 
    before :each do
			allow(GameTypeInterface).to receive(:ask_game_type) {2}
			allow(SymbolInterface).to receive(:get_symbol).with(:player1) {"X"}
			allow(SymbolInterface).to receive(:get_symbol).with(:player2) {"O"}
		  allow(OrderInterface).to receive(:ask_first_player) {:player1}
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
=begin
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
=end
	end

end

