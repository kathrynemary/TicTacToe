require_relative './errors'
require_relative 'interface/display_board_interface'

class Board

  attr_reader :board

  def initialize
    @board = {'0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6, '7' => 7, '8' => 8}
  end

  def available_spaces 
    available_spaces = @board.select {|key,value| value = (0..9) } 
  end

  def pick(player, key) 
    available_spaces
    if available_spaces.has_key?(key) #extract to different method?
      @board[key] = player
      @board
    else
      raise Errors::InputError.new("Error! That space is not available.")
    end
    puts DisplayBoardInterface.display_board(@board)
  end

  def winner?(symbol)
    if actual_winner?(symbol) || tie?
      true
    else
      false
    end
  end

  def actual_winner?(symbol)
    taken = @board.select {|key, value| value == symbol}
    if taken.has_key?(0)
      if taken.has_key?(1) && taken.has_key?(2)
        @row = true
      elsif taken.has_key?(4) && taken.has_key?(8)
        @row = true
      elsif taken.has_key?(3) && taken.has_key?(6)
        @row = true
      end
    elsif taken.has_key?(1) && taken.has_key?(7) && taken.has_key?(4)
      @row = true
    elsif taken.has_key?(2)
      if taken.has_key?(5) && taken.has_key?(8)
        @row = true
      elsif taken.has_key?(4) && taken.has_key?(6)
        @row = true
      end
    elsif taken.has_key?(3) && taken.has_key?(4) && taken.has_key?(5)
      @row = true
    elsif taken.has_key?(6) && taken.has_key?(7) && taken.has_key?(8)
      @row = true
    else
      @row = false
    end
  end
    
  def tie?
    if @row == true
      if available_spaces.empty?
        true
      else
        false
      end
    else
      false
    end
  end

end

