require_relative './board'
require_relative './game'
require_relative './Interface/display_board_interface'
require_relative './player'

class Session

  attr_reader :game, :winner

  def self.game
    @game = Game.new 
  end

  def play_a_game
    #@game = Game.new 
    @game.play_again?
  end
 
  def play_again?
    puts "would you like to play again? y/n"
    answer = gets.chomp.upcase
    check_input(answer)
    evaluate_answer(answer)
  end

  def self.check_input(input)
    unless input.length == 1 && input == "Y" || input.length == 1 && input == "N"
      raise Errors::InputError.new("that input is bad")
    end
  end

  def evaluate_answer(answer)
    if answer == "Y"
      play_a_game   
    else
      exit_session
    end
  end
=begin
  def self.score(player)
    0
  end

  def add_score(player)
    score(player) = 1
    puts score(player)
  end

  def update_score(winner)
    puts winner
    add_score(winner)
  end
=end
#  def self.display_score
#    player.each do |display|
#      puts "#{player}: #{score(player)}"
#    end
#  end


  def exit_session
    #display_score
  end

end

