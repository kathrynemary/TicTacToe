require_relative './tictactoe'
require_relative './player'
require_relative './board'
require_relative './computer'
require_relative './Intelligence'

class Game

  attr_reader :player1
  attr_reader :player2
  attr_reader :board

  def initialize
    @player1 = choose_symbol(player1, symbol="X")
    @player2 = choose_symbol(player2, symbol="0")
    @board = Board.new
  end

  def choose_symbol(player, symbol)
    player = Player.new(symbol)
  end

  def setup(input)
    if input == "Single Player"
      SinglePlayer.new
    elsif input == "Two Player"
      TwoPlayer.new
    elsif input == "Two Computer"
      TwoComputer.new
    end
  end

  def pick(symbol, space)
    @board.pick(symbol, space)
  end

end

class SinglePlayer < Game

  def initialize
    @player2 = Computer.new("O")
  end

   # @player1.name = name || "the human"
   # @player2.name = name || "the computer"

end

class TwoPlayer < Game

 # @player1.name = name || "first human"
 # @player2.name = name || "second human"  

end

class TwoComputer < Game

  def initialize
    @player1 = Computer.new("X")
    @player2 = Computer.new("O")
  end 

 #   @player1.name = "the first computer"
 #   @player2.name = "the second computer"
 
end
