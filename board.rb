
require_relative './tictactoe'

class Board < TicTacToe

  def initialize
    @board = Array.new(9)
    @board.each do |space|
      @space = Space.new(space)
    end
  end

  def size
    @board.length
  end

end

class Space < Board

  attr_reader :number
  attr_reader :picked

  def initialize(number)
    @number = number
    @picked = false
  end

  def pick
    @picked = true
  end

end
