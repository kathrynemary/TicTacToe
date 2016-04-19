require './board'

class Intelligence

  def initialize(preferred_player, symbol, other_symbol, board, depth=0)
		@computer = preferred_player
		@symbol = symbol
		@other_symbol = other_symbol
		@board = board
		@depth = depth
	end

  def choose_move	
		available = @board.available_spaces.keys
		scores = Hash[available.map { |key| [key, branch_out(key)] }]
		scores.key(scores.values.max)
  end

  def find_best_score	
		if @symbol == @computer
			find_high_score
		else
			find_low_score
		end
	end	

  def find_low_score
		available = @board.available_spaces.keys
		scores = available.map { |key| branch_out(key) }
	  scores.min
	end	

	def find_high_score
		available = @board.available_spaces.keys
		scores = available.map { |key| branch_out(key) }
	  scores.max
	end	
		
	def branch_out(key)
		new_depth = @depth + 1
		new_board = Marshal.load(Marshal.dump(@board))
		new_board.board[key] = @symbol
		Intelligence.new(@computer, @other_symbol, @symbol, new_board, new_depth).find_score	
	end
 
  def find_score
		if @board.actual_winner?(@computer)  
			score = 1000 - @depth
		elsif @board.actual_winner?(enemy_player)
			score = -1000 + @depth
		elsif @board.tie?
			score = 0 - @depth
		else
			score = find_best_score
		end
		score
	end

  def enemy_player
    if @computer == @symbol
			@other_symbol
		else
			@symbol
		end
	end

end			

