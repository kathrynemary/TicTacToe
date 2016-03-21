require_relative './board'
require_relative './game'
require_relative './interface'

class Session

  attr_reader :game, :winner

  def initialize
    @game = Interface.ask_game_type
    #monitor_game
  end

  def self.monitor_game
    if @game.game_over
      @winner = @game.winner
      update_score
      play_again?
    end
  end
  
  def self.play_again?
    puts "would you like to play again? y/n"
    answer = gets.chomp.upcase
    check_input(answer)
    evaluate_answer(answer)
  end

  def self.check_input(input)
    unless input.length == 1 && input == "Y" || input.length == 1 && input == "N"
      puts "error!"
    end
  end

  def self.evaluate_answer(answer)
    if answer == "Y"
      new_game   
    else
      exit_session
    end
  end

  def self.new_game
    Interface.game_variety
    monitor_game 
  end

  def self.score(player)
    0
  end

 # def self.update_score
 #   score(winner) += 1
 # end

  def self.display_score
    player.each do |display|
      puts "#{player}: #{score(player)}"
    end
  end


  def self.exit_session
    display_score
  end

end

