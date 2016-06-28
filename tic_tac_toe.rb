require_relative 'tic_tac_toe/board'
require_relative 'tic_tac_toe/computer'
require_relative 'tic_tac_toe/display_board_interface'
require_relative 'tic_tac_toe/errors'
require_relative 'tic_tac_toe/game'
require_relative 'tic_tac_toe/game_builder'
require_relative 'tic_tac_toe/game_builder_game_type_interface'
require_relative 'tic_tac_toe/intelligence'
require_relative 'tic_tac_toe/player'
require_relative 'tic_tac_toe/session'

play_game = Session.new
play_game.play

