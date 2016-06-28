require 'stringio'
require_relative '../tic_tac_toe/board'
require_relative '../tic_tac_toe/computer'
require_relative '../tic_tac_toe/player'
require_relative '../tic_tac_toe/display_board_interface'
require_relative '../tic_tac_toe/game_builder_order_interface'
require_relative '../tic_tac_toe/game_builder_game_type_interface'
require_relative '../tic_tac_toe/game_builder'
require_relative '../tic_tac_toe/game_builder_symbol_interface'
require_relative '../tic_tac_toe/game'
require_relative '../tic_tac_toe/player'
require_relative '../tic_tac_toe/intelligence.rb'

def capture_standardout(&blk)
  old = $stdout
  $stdout = fake = StringIO.new
  blk.call
  fake.string
ensure
  $stdout = old
end
