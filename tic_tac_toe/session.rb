class Session
  
  attr_reader :board, :player1, :player2, :game, :first_player, :second_player

  def play
    game = Game.new
    game.game_play
	end

end
