require_relative './board'
require_relative './game'

class Interface

  attr_reader :player1, :player2, :board, :symbol
  attr_reader :game_variety, :player

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
    raise StandardError.new("The symbol must be one letter character. Please try again.")
    ask_symbol(:player)
  end

end

