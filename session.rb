require_relative './game'

class Session
  
  attr_reader :board, :player1, :player2, :game, :first_player, :second_player

  def initialize
    GameBuilder.new 
    @first_player = GameBuilder.first_player
    @second_player = GameBuilder.second_player
    @board = Board.new
    @game = GameBuilder.game_type   
    @game.game_play
  end

end

Session.new
