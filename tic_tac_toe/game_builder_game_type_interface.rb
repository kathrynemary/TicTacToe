class GameTypeInterface

  attr_reader :player1, :player2, :symbol
  attr_reader :game_variety, :player_names

  def self.run
    #Disabled game_type choice to just work for 1-player game for now.
    #input = ask_game_type
    #game_type(input)
    game_type(1)
  end

  def self.game_type(type)
    if type == 1
      @game_variety = SinglePlayer
    elsif type == 2
      @game_variety = TwoPlayer
		elsif type == 3
			@game_variety = TwoComputer
    end
  end

  def self.game_variety
    @game_variety
  end

  def self.ask_game_type
    puts "Would you like to have a 1-player game(1), a 2-player game(2), or have 2 computers play each other(3)?"
    answer = gets.chomp
    verify_game_type(answer)
  end

  def self.verify_game_type(answer)
    if answer == "1"
      game_type(1)
    elsif answer == "2"
      game_type(2)   
    elsif answer == "3"
      game_type(3) 
    else
      raise Errors::UserError.new("this is a bad answer.")
    end
    @game_variety
  end
  
end

