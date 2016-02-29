require_relative './board'
require_relative './game'
require_relative './player'

class Interface

  attr_reader :player
  attr_reader :symbol

  def get_symbol
    gets.chomp
  end

  def ask_symbol(player)
    @player = player
    puts "What symbol do you want to use for #{@player}?"
    @symbol = get_symbol
    @player = Player.new(symbol)
  end

end

x = Interface.new.ask_symbol("l")
puts x.symbol
