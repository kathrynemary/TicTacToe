require_relative './tictactoe'
require_relative './player'
require_relative './board'


class Game

  attr_reader :player1
  attr_reader :player2
  attr_reader :board

  def initialize
    @player1 = Player.new("X")
    @player2 = Player.new("O")
    @board = Board.new
  end

end
