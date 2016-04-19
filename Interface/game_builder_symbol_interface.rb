require_relative '../board'
require_relative '../game'
require_relative '../errors'

class SymbolInterface
 
  def initialize(player1, player2)
		@player1 = player1
		@player2 = player2
  end
  
	def assign_player1_symbol
		@player1symbol = get_symbol(@player1)
    puts "have assigned player1's symbol"
 	end
 
  def assign_player2_symbol
		@player2symbol = get_symbol(@player2)
  end

  def get_symbol(player)
    ask_symbol(player)
    answer = gets.chomp
    verify_input(answer)
		check_equality
	  answer
  end

  def ask_symbol(player)
    puts "What symbol do you want to use for #{player}?" 
  end

  def verify_input(input)
    if input =~ /\A[a-zA-Z]{1}\z/
      input
    else
      invalid_input
    end
  end

  def invalid_input
    raise Errors::InputError.new("The symbol must be one letter character. Please try again.")
    ask_symbol(:player)
  end
 
  def check_equality
    if @player1symbol.to_s == @player2symbol.to_s
      raise Errors::InputError.new("the symbols can't be the same")
    end
  end
 
 	def player1symbol
    puts "player1's symbol is #{@player1symbol}"
		@player1symbol
  end

  def player2symbol
    @player2symbol
  end

end

