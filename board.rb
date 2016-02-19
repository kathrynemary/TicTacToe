
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
    status
  end

  def status
    winner?
    if true
      if available_spaces.empty?
        "tie"
      else
        "win"
      end
    else
      "not yet"
    end
  end

  def winner?
    taken = @board.select {|key, value| value == "picked"}
    if taken.has_key?(0)
      if taken.has_key?(1) && taken.has_key?(2)
        true
      elsif taken.has_key?(4) && taken.has_key?(8)
        true
      elsif taken.has_key?(3) && taken.has_key?(6)
        true
      end
    elsif taken.has_key?(1) && taken.has_key?(7) && taken.has_key?(4)
      true
    elsif taken.has_key?(2)
      if taken.has_key?(5) && taken.has_key?(8)
        true
      elsif taken.has_key?(4) && taken.has_key?(6)
        true
      end
    elsif taken.has_key?(3) && taken.has_key?(4) && taken.has_key?(5)
      true
    elsif taken.has_key?(6) && taken.has_key?(7) && taken.has_key?(8)
      true
    end
  end

end


@x = Board.new
@x.pick(2)
@x.pick(4)
@x.pick(6)
puts @x.available_spaces
