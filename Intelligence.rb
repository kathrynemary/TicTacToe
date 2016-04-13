require './board'

class Intelligence

  def self.choose_move(symbol, board)
    @symbol = symbol
		@board = board
		minimax(@board, 0)
	  @selection	
	end
  
	def self.calculate_score
    if @board.winner?(@symbol) #it won't know this
			(10 - @levels.to_i)
		elsif @board.winner?(other_symbol)
		 puts "how is it even doing this?"	#get other_score
			(@levels.to_i - 10)
		else
			0
		end
  end

  def self.minimax(board, level)
    available = @board.available_spaces

  	if @board.winner?(@symbol)
			calculate_score
			@levels = @levels.to_i + 1
			scores = []
			moves = []
		end

		puts available
    possible = available.each_key { |key| @board.pick(@symbol, key)  }   
			scores.push	minimax(possible, @levels)
			moves.push space

   # if @game.play_a_turn(symbol) 
      #max_score = scores.each_with_index.max[1]
			#@selection = moves[max_score]
			#scores[max_score]
		#else
		#	min_score = scores.each_with_index.min[1]
		#	@selection = moves[min_score]
		#	scores[min_score]
		#end
	end

end

