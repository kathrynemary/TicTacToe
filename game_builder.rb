require_relative 'Interface/display_board_interface'
require_relative 'Interface/game_builder_game_type_interface'
require_relative 'Interface/game_builder_order_interface'

class GameBuilder 

  def initialize
    game_setup 
    get_order
    game_symbols
  end
      
  def game_setup
    GameTypeInterface.run 
  end

  def self.game_type
    GameTypeInterface.game_variety
  end

  def game_symbols
    SymbolInterface.order_of_operations
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

  def first_player_symbol
    OrderInterface.first_player_symbol
  end

  def second_player_symbol
    OrderInterface.second_player_symbol
  end

end
