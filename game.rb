require_relative './player'
require_relative './board'
require_relative 'Interface/display_board_interface'
require_relative './game_builder'
require_relative './computer'
require_relative 'intelligence'

class Game
  
  attr_reader :board, :game, :first_player_symbol, :second_player_symbol

  def initialize
    @game_builder = GameBuilder.new
		@game_builder.build_game
    @game_type = GameBuilder.game_type
		@first_player_symbol = @game_builder.player1symbol
		@second_player_symbol = @game_builder.player2symbol
		@board = Board.new
  end

  def game_play
    until game_over
      play_a_turn(@first_player_symbol) 
			play_a_turn(@second_player_symbol) #have it check before this
    end
  end
  
  def get_player_type(player)
    if @game_type == TwoComputer
			@player_type = Computer
    elsif GameBuilder.game_type == SinglePlayer && player == @second_player_symbol
		 	@player_type = Computer
    else
      @player_type = Player
    end
  end

  def play_a_turn(player)
		get_player_type(player)
    if @player_type == Computer
	    computer_turn(player)
    else
      space = DisplayBoardInterface.ask_space(:board)
      @board.pick(player, space)
    end
  end

  def computer_turn(player)
		puts "let me think..."
		enemy = get_other_player(player)
		invoke_ai = Intelligence.new(player, player, enemy, @board)
		find_move = invoke_ai.choose_move
		@board.pick(player, find_move)
		DisplayBoardInterface.display_board(:board)
	end

  def get_other_player(player)
	  if player = @player1symbol
			other_player = @player2symbol
		else
			other_player = @player1symbol
		end
		puts other_player
		other_player
	end

  def check_winner(player)
    if @board.tie? == false
      puts "#{player} has won!"
      @winner = player
    else
      puts "There was a tie!"
    end
  end

  def game_over
    if @board.winner?(@first_player_symbol) == true || @board.winner?(@second_player_symbol) == true
      puts "Game over!"
			if @board.winner?(@first_player_symbol) == true
        check_winner(@first_player_symbol)
			else
        check_winner(@second_player_symbol)
			end
    end
  end

end

class SinglePlayer < Game
  def initialize
    super
    @player1 = Player
    @player2 = Computer
  end
end

class TwoPlayer < Game
  def initialize
    super
    @player1 = Player
    @player2 = Player
  end
end

class TwoComputer < Game
  def initialize
    super
    @player1 = Computer
    @player2 = Computer
  end 
end

