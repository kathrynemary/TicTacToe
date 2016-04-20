require_relative 'interface/display_board_interface'
require_relative 'interface/game_builder_game_type_interface'
require_relative 'interface/game_builder_order_interface'

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
