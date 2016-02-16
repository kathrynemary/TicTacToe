require_relative './tictactoe'
require_relative './board'

class Player < TicTacToe

  def initialize
    @board = Board.new_board
    @player1 = "X"
    @player2 = "O"

    puts "\n#{@board}"
  end

end
