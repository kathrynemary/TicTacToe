require_relative './player'
require_relative './board'
require_relative 'Interface/display_board_interface'
require_relative './game_builder'
require_relative './computer'

class Game
  
  attr_reader :board, :game, :first_player_symbol, :second_player_symbol

  def initialize
    @first_player_symbol = GameBuilder.first_player_symbol
    @second_player_symbol = GameBuilder.second_player_symbol
    @board = Board.new
  end

  def game_play
    until game_over(@first_player_symbol) || game_over(@second_player_symbol)
      play_a_turn(@first_player_symbol) 
      play_a_turn(@second_player_symbol)
    end
  end
  
  def play_a_turn(player)
    space = DisplayBoardInterface.ask_space(:board)
    @board.pick(player, space)
  end

  def check_winner(player)
    if @board.tie? == false
      puts "#{player} has won!"
      @winner = player
    else
      puts "There was a tie!"
    end
  end

  def game_over(player)
    if @board.winner?(player) == true
      puts "Game over!"
      check_winner(player)
    end
  end

end

class SinglePlayer < Game
  def initialize
    super
    @player1 = Player
    @player2 = Computer
  end
end

class TwoPlayer < Game
  def initialize
    super
    @player1 = Player
    @player2 = Player
  end
end

class TwoComputer < Game
  def initialize
    super
    @player1 = Computer
    @player2 = Computer
  end 
end

