require './board'

class Intelligence

  def initialize(symbol, other_symbol, board)
    @symbol = symbol
		@other_symbol = other_symbol
		@board = board
	end

  def choose_move
		minimax(@board, 0)
	  @selection	
	end
  
	def calculate_score
    if @board.winner?(@symbol) 
		  (10 - @levels.to_i)
		elsif @board.winner?(@other_symbol)
			(@levels.to_i - 10)
		else
			0
		end
  end

  def minimax(board, level)
		@scores = []
		@moves = []
  	#until @board.winner?(@symbol)
      available = @board.available_spaces.keys
      @levels = level

      available.each do |key|
				@board.board[key] = @symbol
				#@levels += 1
	      if @board.winner?(@symbol)  
					@selection = key
					break
				else
          @board.board[key] = key #this knows way too much but YOLO!
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

end

