require_relative './game'

class Session
  
  attr_reader :board, :player1, :player2, :game, :first_player, :second_player

  def initialize
    game = Game.new 
    game.game_play
	end

end

Session.new
