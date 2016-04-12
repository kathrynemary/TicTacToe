require './board'

class Intelligence

  def self.choose_move(symbol, board)
    @board = board
    sets = [['0','1','2'], ['3','4','5'], ['6','7','8'], ['0','3','6'], ['1','4','7'], ['2','5','8'], ['0','4','8'], ['2','4','6']] 
    @taken_by_self = @board.board.select {|key, value| value == symbol}	

		sets.each_index {|x|
      @a = (@taken_by_self.has_key? sets[x][0])
      @b = (@taken_by_self.has_key? sets[x][1])
      @c = (@taken_by_self.has_key? sets[x][2])
      if !@a && @b && @c
        return sets[x][0]
      elsif !@b && @a && @c
        return sets[x][1]
      elsif !@c && @a && @b
        return sets[x][2]
      end
    }

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
    if @board.available_spaces.has_key?('4')
      '4'
    else
      @board.available_spaces.first[0]
    end
  end

end

#recognize difference in other_player almost winning vs self, and have self win when there's a choice.
