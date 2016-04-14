require './board'

class Intelligence

  def initialize(symbol, other_symbol, board)
    @symbol = symbol
		@other_symbol = other_symbol
		@board = board
		@level = 0
	end

  def choose_move
		until @selection
			minimax(@board, @level)
		end
	  @selection
	end
  
	def calculate_score
		#if @board.winner?(@symbol) 
		#  (10 - @levels.to_i)
		#elsif @board.winner?(@other_symbol)
		#	(@levels.to_i - 10)
		#else
		#	0
		#end
  end

  def minimax(board, level)
    #@score = {}
		@available = @board.available_spaces.keys
    @levels = level
    check_for_wins
		unless @selection
			first = @available[0]
			@board.board[first] = @symbol
			check_for_wins
				@board.board[first] = first

			#@available.each do |key|
			#	@board.board[key] = @symbol
			#	puts @available
			#	check_for_wins
		  #end
		end
	end
		
  def check_for_wins
    @available.each do |key|
			@board.board[key] = @symbol	
			if @board.winner?(@symbol)  
				puts "#{key} will let me win!"
				#@score[key] = 10
				@selection = key
				break
			else
				@board.board[key] = key #this knows way too much but YOLO!
		  end
		end
	end

end			
				#	  @scores.push(possible_move)	#minimax(possible, @levels)
		 # 	puts "updated scores: #{@scores}"	
		#		@moves.push(possible_move)
		#		puts "updated moves: #{@moves}"
 
    #calculate_score

		#if @symbol 
#			max_score = 2 #@scores.max
#			@selection = "2" #@moves[max_score]
			 #@scores[max_score]	
			#else
				#min_score = @scores.min
				#@selection = @moves[min_score]
				#@scores[min_score]
			  #min_score
		#end

