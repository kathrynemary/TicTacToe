require_relative 'Interface/display_board_interface'
require_relative 'Interface/game_builder_game_type_interface'
require_relative 'Interface/game_builder_order_interface'

class GameBuilder 

  def self.game_setup
    GameTypeInterface.run 
  end

  def self.game_symbols
    SymbolInterface.order_of_operations
    player1symbol
    player2symbol 
  end

  def self.player1symbol
    SymbolInterface.player1symbol
  end
  
  def self.player2symbol
    SymbolInterface.player2symbol
  end

  def self.get_order
    OrderInterface.ask_first_player
  end

  def self.first_player
    OrderInterface.first_player
  end

  def self.second_player
    OrderInterface.second_player
  end

end
