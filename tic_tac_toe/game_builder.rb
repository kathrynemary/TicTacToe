require_relative 'game_builder_order_interface'
require_relative 'game_builder_symbol_interface'

class GameBuilder

  def build_game
    game_setup 
    get_order
		@player1 = first_player
		@player2 = second_player
    game_symbols(@player1, @player2)
  end
      
  def game_setup
    GameTypeInterface.run 
  end

  def game_type
    GameTypeInterface.game_variety
  end

  def game_symbols(player1, player2)
    symbols = SymbolInterface.new(player1, player2)
		@player1symbol = symbols.assign_player1_symbol
		@player2symbol = symbols.assign_player2_symbol
  rescue
    puts "Oh no! The symbol must be a one-letter character, and must not be the same for the two players."
    game_symbols(player1, player2)
  end

	def player1symbol
    @player1symbol
	end

	def player2symbol
    @player2symbol
  end

  def get_order
    OrderInterface.ask_first_player
  end

  def first_player
    OrderInterface.first_player
	end

  def second_player
		OrderInterface.second_player
  end

end
