require_relative './player'
require_relative './board'
require_relative 'Interface/display_board_interface'
require_relative './game_builder'
require_relative 'Interface/game_builder_symbol_interface'
require_relative 'Interface/game_builder_game_type_interface'
require_relative 'Interface/game_builder_order_interface'

class Game
  
  attr_reader :board, :player1, :player2, :game, :first_player, :second_player

  def initialize
    GameBuilder.new 
    @first_player = GameBuilder.first_player
    @second_player = GameBuilder.second_player
    @board = Board.new
  end

  def game_play
    until game_over(:first_player)
      play_a_turn(:first_player)
      game_over(:first_player)
      play_a_turn(:second_player)
      game_over(:second_player)
    end
  end
  
  def play_a_turn(player)
    space = DisplayBoardInterface.ask_space(:board)
    pick(player, space)   
  end

  def pick(player, space)
    @board.pick(player, space)
  end

  def self.check_winner(player)
    if @board.tie? == false
      puts "#{player} has won!"
      player.udpate_score 
      @winner = player
    else
      puts "There was a tie!" #does this need to go elsewhere
    end
  end

  def game_over(player)
    if @board.winner?(player)
      puts "Game over!"
      check_winner(player)
    end
  end

end

class SinglePlayer < Game
  def initialize
    @player1 = Player.new
    @player2 = Computer.new 
  end
end

class TwoPlayer < Game
  def initialize
    @player1 = Player.new
    @player2 = Player.new
  end
end

class TwoComputer < Game
  def initialize
    @player1 = Computer.new
    @player2 = Computer.new
  end 
end
