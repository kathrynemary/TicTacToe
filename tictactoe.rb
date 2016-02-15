class TicTacToe

end

class Board < TicTacToe

  def self.new_board
    "| 0 | 1 | 2 |\n| 3 | 4 | 5 |\n| 6 | 7 | 8 |"
  end

  def self.update(value, spot)
    @value = value
    @spot = spot
    @board = new_board

    @board.gsub!("#{@spot}", "#{@value}")
  end

end
