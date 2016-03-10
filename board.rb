class Board

  attr_reader :board

  def initialize
    @board = {0 => 0, 1 => 1, 2 => 2, 3 => 3, 4 => 4, 5 => 5, 6 => 6, 7 => 7, 8 => 8}
  end

  def available_spaces
    @board.select {|key,value| value.instance_of?(Fixnum) }
  end

  def pick(player, key)
    if available_spaces.include? key
      @board[key] = player
      @board
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
