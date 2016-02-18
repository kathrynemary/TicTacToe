
require_relative './tictactoe'

class Board

  attr_reader :board

  def initialize
    @board = {0 => "open", 1 => "open", 2 => "open", 3 => "open", 4 => "open", 5 => "open", 6 => "open", 7 => "open", 8 => "open"}
  end

  def available_spaces
    @board.select {|key,value| value == "open"}
  end

  def pick(key)
    @board[key] = "picked"
  end

end
