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
      game.print_board
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
    loop do
      puts "Player #{@current_player} turn!\n\n"

      puts 'Please enter the row where you want to put your move (1-2-3):'
      row = gets.chomp.to_i

      puts 'Please enter the column where you want to put your move (1-2-3):'
      column = gets.chomp.to_i

      break unless game.put_symbol_in_board(player_to_symbol, row - 1, column - 1) == 'Error'

      puts "Sorry, that space is already taken. Use another please.\n\n"
    end
  end
end

_ = Main.new
