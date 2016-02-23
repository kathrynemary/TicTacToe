
require_relative './tictactoe'

class Board

  attr_reader :board

  def initialize
    @board = {0 => "open", 1 => "open", 2 => "open", 3 => "open", 4 => "open", 5 => "open", 6 => "open", 7 => "open", 8 => "open"}
  end

  def available_spaces
    @board.select {|key,value| value == "open"}
  end

  def pick(symbol, key)
    if available_spaces.include? key
      @board[key] = symbol
    else
      "Error!"
    end
  end

  def exclude?(thing)
    unless available_spaces.has_key? thing
      return true
    else
      return false
    end
  end

  def winner?(symbol)
    taken = @board.select {|key, value| value == symbol}
    if taken.has_key?(0)
      if taken.has_key?(1) && taken.has_key?(2)
        row = true
      elsif taken.has_key?(4) && taken.has_key?(8)
        row = true
      elsif taken.has_key?(3) && taken.has_key?(6)
        row = true
      end
    elsif taken.has_key?(1) && taken.has_key?(7) && taken.has_key?(4)
      row = true
    elsif taken.has_key?(2)
      if taken.has_key?(5) && taken.has_key?(8)
        row = true
      elsif taken.has_key?(4) && taken.has_key?(6)
        row = true
      end
    elsif taken.has_key?(3) && taken.has_key?(4) && taken.has_key?(5)
      row = true
    elsif taken.has_key?(6) && taken.has_key?(7) && taken.has_key?(8)
      row = true
    else
      row = false
    end

    if row == true
      if available_spaces.empty?
        "tie"
      else
        true
      end
    else
      false
    end
  end

end
