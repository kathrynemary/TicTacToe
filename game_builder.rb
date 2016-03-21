require_relative './interface'
require_relative './game'

class GameBuilder

  attr_reader :symbol, :player1, :player2, :game, :first_player, :other_player

  def initialize
    game_setup 
    @player1 = choose_symbol(:player1)
    @player2 = choose_symbol(:player2)
    get_first_player
  end

  def get_first_player
    @first_player = Interface.get_order
    if @first_player == player1
      @other_player = player2
    else
      @other_player = player1
    end
  end
  
  def choose_symbol(player)
    @symbol = Interface.ask_symbol(player)
    player = Player.new(symbol)
  end

  def game_setup
    result = Interface.ask_game_type
    game(result)
  end

  def self.game(type)
    @game = Interface.verify_game_type(type)
  end

end

