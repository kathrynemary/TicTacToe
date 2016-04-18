require './board'

class Intelligence

  def initialize(preferred_player, symbol, other_symbol, board, depth=0)
		@computer = preferred_player
		@symbol = symbol
		@other_symbol = other_symbol
		@board = board
		@depth = depth
		puts "currently on level #{@depth}" #delete eventually
	end

  def choose_move	
		available = @board.available_spaces.keys
		scores = Hash[available.map { |key| [key, branch_out(key)] }]
    scores.key(scores.values.max)
	end

  def find_high_score
		available = @board.available_spaces.keys
		scores = available.map { |key| branch_out(key) }
	  scores.max
	end	
		
	def branch_out(key)
		new_depth = @depth + 1
		#new_board = @board.clone
		new_board = Marshal.load(Marshal.dump(@board))
		new_board.board[key] = @symbol
	  Intelligence.new(@computer, @other_symbol, @symbol, new_board, new_depth).find_score	
	end
 
  def find_score
		if @board.actual_winner?(@computer)  
			puts "setting a win score"
			score = 10 - @depth
		elsif @board.actual_winner?(enemy_player)
			puts "setting a loss score"
			score = -10 - @depth
		elsif @board.available_spaces.length == 0
			puts "setting a tie score"
			score = 0 - @depth
		else
			puts "branching out"
			score = find_high_score
			puts @board.board
			puts "score is #{score}"
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

