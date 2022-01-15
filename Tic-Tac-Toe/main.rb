# frozen_string_literal: true

# Classes
require './classes/game'

new_game = Game.new

new_game.print_board

p new_game.check_board_status || 'Next turn!'
