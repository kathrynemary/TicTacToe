require './board'
require './game'

class Intelligence

  def self.choose_move(board)
    @board = board

    sets = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
    sets.each_index {|x|
      @a = (@board.available_spaces.has_key? sets[x][0])
      @b = (@board.available_spaces.has_key? sets[x][1])
      @c = (@board.available_spaces.has_key? sets[x][2])
      if @a && !@b && !@c
        return sets[x][0]
      elsif @b && !@a && !@c
        return sets[x][1]
      elsif @c && !@a && !@b
        return sets[x][2]
      end
    }
    pick_middle
  end

  def self.pick_middle
    if @board.available_spaces.has_key? 4
      return 4
    else
      return "I give up."
    end
  end

end
