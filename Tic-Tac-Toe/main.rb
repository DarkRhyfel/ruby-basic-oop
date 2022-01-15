# frozen_string_literal: true

# Classes
require './classes/game'

# Main Class
class Main
  # Variables Accessors
  attr_accessor :game

  def initialize
    @game = Game.new
    @current_player = 1

    until game.check_board_status
      ask_player_input
      change_player
    end

    puts game.check_board_status
  end

  private

  def change_player
    @current_player = @current_player == 1 ? 2 : 1
  end

  def player_to_symbol
    @current_player == 1 ? 'X' : 'O'
  end

  def ask_player_input
    puts "Player #{@current_player} turn!"

    puts 'Please enter the row where you want to put your move:'
    row = gets.chomp.to_i

    puts 'Please enter the column where you want to put your move:'
    column = gets.chomp.to_i

    game.put_symbol_in_board(player_to_symbol, row, column)
    game.print_board
  end
end

_ = Main.new
