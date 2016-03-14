require_relative './tictactoe'
require_relative './player'
require_relative './board'
require_relative './computer'
require_relative './Intelligence'
require_relative './interface'

class Game

  attr_reader :player1
  attr_reader :player2
  attr_reader :board
  attr_reader :winner

  def initialize
    @player1 = choose_symbol(player1)
    @player2 = choose_symbol(player2)
    @board = Board.new
  end

  def choose_symbol(player)
    symbol = Interface.ask_symbol(player)
    player = Player.new(symbol)
  end

  def setup
    Interface.ask_game_type
  end

  def pick(player, space)
    @board.pick(player, space)
    game_over(player)
  end

  def check_winner(player)
    puts "#{player} has won!"
    @winner = player
  end

  def game_over
    if @board.winner?(player)
      puts "Game over!"
      check_winner(player)
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
