require './board'

class Intelligence

  def initialize(symbol, other_symbol, board)
    @symbol = symbol
		@other_symbol = other_symbol
		@board = board
		@level = 0
	end

  def choose_move
		minimax(@board, @level)
		if @selection
			@selection
		else
			branch_out
		end
		@selection
	end 

  def minimax(board, level)
		@scores = {}
		@available = @board.available_spaces.keys
    @levels = level
		check_for_wins
	end
		
	def branch_out
		@available.each do |key|
			@level += 1
			Intelligence.new(@symbol, @other_symbol, @board).choose_move
			Intelligence.new(@other_symbol, @symbol, @board).choose_move
		end
	end
		
  def check_for_wins
    @available.each do |key|
			@board.board[key] = @symbol
			if @board.winner?(@symbol)  
				puts "#{key} will let me win!" #delete this eventually
				@scores[key] = 10
				@selection = key
				break
			elsif @board.winner?(@other_symbol)
				@scores[key] = -10
			else
				@scores[key] = 0
				@board.board[key] = key #this knows way too much
			end
		end
	end

end			

