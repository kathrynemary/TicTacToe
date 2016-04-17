require_relative '../board'
require_relative '../game'
require_relative '../errors'
require_relative './game_builder_game_type_interface'

class SymbolInterface

  attr_reader :player1, :player2, :symbol
  
  def self.order_of_operations
    symbol = get_symbol(:player1)
    assign_player1_symbol(symbol)
    symbol2 = get_symbol(:player2)
    assign_player2_symbol(symbol2)
    check_equality
  end

  def self.ask_symbol(player)
    "What symbol do you want to use for #{GameTypeInterface.player1_name}?" 
  end

  def self.get_symbol(player)
    @player = player
    puts ask_symbol(player)
    x = gets.chomp
    verify_input(x)
	  x	
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
 
  def self.player1symbol
    @player1symbol
  end

  def self.assign_player2_symbol(symbol)
    @player2symbol = symbol
  end

  def self.player2symbol
    @player2symbol
  end

  def self.check_equality
    if @player1symbol.to_s == @player2symbol.to_s
      raise Errors::InputError.new("the symbols can't be the same")
    end
  end

end

