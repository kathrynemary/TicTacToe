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

  def minimax(board, level)
    #@score = {}
		@available = @board.available_spaces.keys
    @levels = level
    check_for_wins
		unless @selection
	    @available.each {|key| 
				puts "looking at #{key} now" #delete this later
				@board.board[key]
	      check_for_wins
		    @board.board[key] = key
			}
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
				puts "#{key} won't let me win" #delete this later
				@board.board[key] = key #this knows way too much but YOLO!
		  end
		end
	end

end			

