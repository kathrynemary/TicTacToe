class SymbolInterface
 
  def initialize(player1, player2)
		@player1 = player1
		@player2 = player2
  end
  
	def assign_player1_symbol
		@player1symbol = get_symbol(@player1)
 	end
 
  def assign_player2_symbol
	  answer = get_symbol(@player2)
		check_equality(@player1symbol, answer)
    @player2symbol = answer
	end

  def get_symbol(player)
    answer = ask_symbol(player)
    #answer = gets.chomp
    verify_input(answer)
		if @player1symbol && @player2symbol
		  check_equality
		end
		answer
  end

  def ask_symbol(player)
    puts "What symbol do you want to use for #{player}?" 
    answer = gets.chomp
	end

  def verify_input(input)
    if input =~ /\A[a-zA-Z]{1}\z/
      input
    else
      invalid_input
    end
  end

  def invalid_input
    raise Errors::UserError.new
  end
 
  def check_equality(symbol_1, symbol_2)
		if symbol_1.to_s == symbol_2.to_s
			raise Errors::UserError.new
		end
  end
 
 	def player1symbol
		@player1symbol
  end

  def player2symbol
		@player2symbol
  end

end

