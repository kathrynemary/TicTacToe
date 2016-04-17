require './board'

class Intelligence

  def initialize(symbol, other_symbol, board, depth=0)
    @symbol = symbol
		@other_symbol = other_symbol
		@board = board
		@depth = depth
	end

  def choose_move
	  puts "currently on level #{@depth}"
		minimax(@board, @depth)
    until @board.winner?(@symbol)
		#until @selection
	  	branch_out
	    puts @selection
		end
		find_high_score
	end

  def find_high_score
		puts @scores
    @scores.key(@scores.values.max)
	end	

  def minimax(board, depth=@depth)
		@scores = {}
		@available = @board.available_spaces.keys
		check_for_wins
	end
		
	def branch_out
		new_depth = @depth + 1
		@available.each do |key|
      @board.board[key] = @symbol
			Intelligence.new(@symbol, @other_symbol, @board, new_depth).minimax(@board)	
		end
	end
		
  def check_for_wins
    @available.each do |key|
			@board.board[key] = @symbol
			if @board.winner?(@symbol)  
				puts "#{key} will let me win!" #delete this
				@scores[key] = 10
				@selection = key
				break
			elsif @board.winner?(@other_symbol)
				@scores[key] = -10
			else
			  puts "#{key} will not let me win"
				@scores[key] = 0
				@board.board[key] = key #this knows way too much
			end
		end
	end

end			

