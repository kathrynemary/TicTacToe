require_relative './player'
require_relative './board'
require_relative './computer'
require_relative 'Interface/interface'
require_relative './game_builder'

class Game
  
  attr_reader :board, :symbol, :player1, :player2, :game, :first_player, :other_player

  def initialize
    GameBuilder.new 
    @board = Board.new
#    game_play
  end

  def game_play
    until game_over(first_player)
      play_a_turn(first_player)
      game_over(first_player)
      play_a_turn(other_player)
      game_over(other_player)
    end
  end
  
  def play_a_turn(player)
    space = Interface.ask_space
    pick(player, space)   
  end

  def pick(player, space)
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
    if @board.winner?(player)
      puts "Game over!"
      check_winner(player)
    else
      puts "game not over yet"
    end
  end

end

class SinglePlayer < Game

  def initialize
    @player2 = Computer.new("O")
    puts "I have started a new SinglePlayer game!"
  end

end

class TwoPlayer < Game

end

class TwoComputer < Game

  def initialize
    @player1 = Computer.new("X")
    @player2 = Computer.new("O")
  end 

end
