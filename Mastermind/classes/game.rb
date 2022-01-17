# frozen_string_literal: true

require './modules/game_logic'
require './resources/text_contents'

# Game class
# Defines the methods to play a mastermind game
class Game
  include GameLogic
  include TextContents

  attr_reader :code_selected

  def initialize
    @turns = TURNS
  end

  def play
    puts COMMON_MESSAGES[:welcome]
    computer_maker

    while @turns.positive?
      break if play_turn

      @turns -= 1
    end

    puts @turns.positive? ? RESULT_MESSAGES[:winner] : format(RESULT_MESSAGES[:loser], turns: TURNS)
  end

  def play_turn
    puts COMMON_MESSAGES[:human_guess]
    guess = gets.chomp.split(',').map(&:strip)

    result = human_guess(guess)
    puts format(COMMON_MESSAGES[:check_result], results: result)

    result.all?('C')
  end

  def computer_maker
    @code_selected = CODE_PEG_COLORS.sample(4)
  end

  def human_guess(guess_colors)
    code_selected
      .zip(guess_colors)
      .map { |code, guess| compare_guess(code_selected, code, guess) }
  end
end
