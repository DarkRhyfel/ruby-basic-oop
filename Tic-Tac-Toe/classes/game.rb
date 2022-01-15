# frozen_string_literal: true

# Game class
class Game
  # Variable accessors
  attr_accessor :board

  def initialize
    @board = Array.new(3) { Array.new(3, ' ') }
  end

  def board_diagonals
    first_diagonal = (0..2).map { |i| board[i][i] }
    second_diagonal = (0..2).map { |i| board[i][2 - i] }

    [first_diagonal, second_diagonal]
  end

  def put_symbol_in_board(symbol, row, column)
    board[row][column] = symbol
  end

  def three_in_a_row(board)
    result = board.find { |row| row.uniq.length == 1 }

    if result
      result[0] == ' ' ? nil : result[0]
    else
      result
    end
  end

  def check_board_status
    result =
      three_in_a_row(board) ||
      three_in_a_row(board.transpose) ||
      three_in_a_row(board_diagonals)

    "#{result} is the winner!" if result
  end

  def print_board
    board.each do |row|
      puts '-------------'
      puts "| #{row[0]} | #{row[1]} | #{row[2]} |"
    end

    puts '-------------'
  end
end
