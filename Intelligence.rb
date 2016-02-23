require './board'
require './game'

class Intelligence

  def self.choose_move(board)
    @board = board
    if @board.exclude?(0) && @board.exclude?(1)
      if @board.available_spaces.has_key? 2
        return 2
      else
        if @board.available_spaces.has_key? 4
          return 4
        end
      end
    else
      if @board.available_spaces.has_key? 4
        return 4
      end
    end
  end

  # def self.almost_winning
  #   if @board.exclude?(0) && @board.exclude?(1)
  #     if @board.available_spaces.has_key? 2
  #       return 2
  #     else
  #       false
  #     end
  #   else
  #     false
  #   end
  # end

end
