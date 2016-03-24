require_relative '../board'
require_relative '../game'
require_relative '../errors'
#require_relative '../Interface/game_builder_game_type_interface'

class OrderInterface

  def self.ask_first_player
    puts "what is the 1st player? 1 or 2"
    answer = gets.chomp
    get_first_player(answer)
  end

  def self.get_first_player(input) 
    puts "now in get_first_player"
    @input = input
    raise Errors::InputError.new("this is a bad answer.") unless correct_player?
    translate_input(input)
  end

  def self.translate_input(input) 
    if input =~ /1/
      @first_player = :player1
    else
      @first_player = :player2
    end
  end

  def self.correct_player?  
    @input =~ /1|2/
  end

  def self.first_player
    puts "now using first player"
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
