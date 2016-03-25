require_relative '../board'
require_relative '../game'
require_relative '../errors'

class GameTypeInterface

  attr_reader :player1, :player2, :symbol
  attr_reader :game_variety, :player_names

  def self.run
    input = ask_game_type
    game_type(input)
  end

  def self.game_type(type)
    if type == 1
      @game_variety = SinglePlayer.new
    elsif type == 2
      @game_variety = TwoPlayer.new
    elsif type == 3
      @game_variety = TwoComputer.new
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
      raise Errors::InputError.new("this is a bad answer.")
    end
    @game_variety
  end
  
  def self.set_player_names
    if @game_variety.instance_of? SinglePlayer
      @player_names = {:player1 => "you", :player2 => "the computer"}
    elsif @game_variety.instance_of? TwoPlayer
      @player_names = {:player1 => "the first human", :player2 => "the second human"}
    elsif @game_variety.instance_of? TwoComputer  
      @player_names = {:player1 => "the first computer", :player2 => "the second computer"}
    end
  end

  def self.name(player)
    set_player_names
    @player_names.fetch(player)
  end

end

