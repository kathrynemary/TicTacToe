require_relative '../errors'

class OrderInterface

  def self.ask_first_player 
    answer = first_player_answer 
    get_first_player(answer)
  end

  def self.first_player_answer #use correct names for players
    puts "what is the 1st player? 1 or 2"
    answer = gets.chomp
  end

  def self.get_first_player(input)
    @input = input 
    raise Errors::InputError.new("this is a bad answer.") unless correct_player?
    translate_input(input)
  end

  def self.translate_input(input) 
    if @input =~ /1/
      @first_player = :player1
    else
      @first_player = :player2
    end
  end

  def self.correct_player?  
    @input =~ /1|2/
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
