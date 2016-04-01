require_relative './board'

class Player

 # attr_reader :symbol

  def initialize
   # @symbol = symbol
    @score = 0
  end

  def self.score
    @score.to_i
  end

  def self.update_score
    @score = @score.to_i + 1
  end

end
