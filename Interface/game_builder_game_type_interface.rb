require_relative './board'
require_relative './game'

class GameTypeInterface

  attr_reader :player1, :player2, :board, :symbol
  attr_reader :game_variety, :player

  def self.name(player) #returning a hash, not a single value
    if @game_variety == SinglePlayer
      {:player1 => "you", :player2 => "the computer"}
    elsif @game_variety == TwoPlayer
      {:player1 => "the first human", :player2 => "the second human"}
    elsif @game_variety == TwoComputer  
      {:player1 => "the first computer", :player2 => "the second computer"} 
    end
  end

  def self.game_type(type)
    if type == 1
      @game_variety = SinglePlayer.new
    elsif type == 2
      @game_variety = TwoPlayer.new
    elsif type == 3
      @game_variety = TwoComputer.new
    end
    puts "I've updated game_type!"
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
      puts "Invalid answer! Try again."
      ask_game_type
    end
    @game_variety
  end

end

