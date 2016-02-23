require './board'
require './game'

class Intelligence

  def self.choose_move(board)
    almost_winning

    if board.available_spaces.include? 4
      return 4
    end
  end

  def self.almost_winning
    x = @board.available_spaces
    if @board.available_spaces.exclude?(0) && @board.available_spaces.exclude?(1)
      if @board.available_spaces.include? 2
        return 2
      else
        false
      end
    else
      false
    end
  end

end

@x = Board.new
@x.pick("y", 0)
@x.pick("y", 1)

puts @x.available_spaces.exclude?(0)
