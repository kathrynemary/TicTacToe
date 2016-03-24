require_relative '../board'
require_relative '../game'
require_relative '../errors'
#require_relative '../Interface/game_builder_game_type_interface'

class OrderInterface

  def self.get_first_player(input)
    puts "what is the 1st player?"
    raise Errors::InputError.new("this is a bad answer.") unless correct_player?
    @first_player = input
  end

  def self.correct_player?
    @first_player =~ /:player1|:player2/
  end

  def self.first_player
    @first_player
  end	

  def self.second_player
    if first_player == :player1
      @second_player = :player2
    else 
      @second_player = :player1
    end
  end

end
