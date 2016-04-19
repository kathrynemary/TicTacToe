require_relative '../errors'
require_relative './game_builder_game_type_interface'
require_relative './game_builder_symbol_interface'

class OrderInterface

  def self.ask_first_player 
    answer = first_player_answer 
    get_first_player(answer)
  end

  def self.first_player_answer
    puts first_player_text
    answer = gets.chomp
  end

  def self.first_player_text	  
    "what is the 1st player? 1 or 2?" #fix this later. #{GameTypeInterface.name(:player1)} or #{GameTypeInterface.name(:player2)}"
  end

  def self.get_first_player(input)
    @input = input 
    raise Errors::InputError.new("this is a bad answer.") unless correct_player?
    translate_input(input)
  end

  def self.translate_input(input)
    if @input =~ /1/
      @first_player = :player1
 #     @first_player_symbol = SymbolInterface.player1symbol
    else
      @first_player = :player2
 #     @first_player_symbol = SymbolInterface.player2symbol
    end
		second_player
	end

#  def self.first_player_symbol
#    @first_player_symbol
#  end
  
#  def self.second_player_symbol
#	 	@second_player_symbol
#  end

  def self.correct_player?  
    @input =~ /1|2/
  end

  def self.first_player 
    @first_player
  end	

  def self.second_player
		if first_player == :player1
			@second_player = :player2
#      @second_player_symbol = SymbolInterface.player2symbol
    else 
      @second_player = :player1
#      @second_player_symbol = SymbolInterface.player1symbol
    end
#    puts "order interface says second_player symbol is #{@second_player_symbol}"
		@second_player
  end

end
