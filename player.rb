require_relative './tictactoe'
require_relative './board'

class Player < TicTacToe

  attr_reader :symbol

  def initialize(symbol)
    @symbol = symbol
  end

end
