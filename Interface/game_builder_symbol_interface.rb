require_relative '../board'
require_relative '../game'
require_relative '../errors'

class SymbolInterface

  attr_reader :player1, :player2, :symbol 
  
  def order_of_operations #not sure how to test this
    symbol = ask_symbol(:player1)
    assign_player1_symbol(symbol)
    symbol2 = ask_symbol(:player2)
    assign_player2_symbol(symbol2)
    check_equality
  end

  def self.ask_symbol(player)
    puts "What symbol do you want to use for #{player}?"
    @player = player
    x = gets.chomp
    verify_input(x) 
  end

  def self.verify_input(x)
    if x =~ /\A[a-zA-Z]{1}\z/
      x
    else
      invalid_input
    end
  end

  def self.invalid_input
    raise Errors::InputError.new("The symbol must be one letter character. Please try again.")
    ask_symbol(:player)
  end


  def self.assign_player1_symbol(symbol)
     @player1symbol = symbol
  end
  
  def self.assign_player2_symbol(symbol)
    @player2symbol = symbol
  end

  def self.check_equality
    if @player1symbol.to_s == @player2symbol.to_s
      raise Errors::InputError.new("the symbols can't be the same")
    end
  end

end

