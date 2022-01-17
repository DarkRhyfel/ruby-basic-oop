# frozen_string_literal: true

require './modules/game_logic'
require './resources/text_contents'
require './classes/human_player'
require './classes/computer_player'

# Game class
# Defines the methods to play a mastermind game
class Game
  include GameLogic
  include TextContents

  def initialize
    @turns = TURNS
    @human = HumanPlayer.new
    @computer = ComputerPlayer.new
  end

  def play
    puts COMMON_MESSAGES[:welcome]
    type = player_type

    @code_selected = type == 1 ? @human.human_maker : @computer.computer_maker

    while @turns.positive?
      break if play_turn(type)

      @turns -= 1
    end

    print_result(type)
  end

  private

  def player_type
    puts COMMON_MESSAGES[:type]
    gets.chomp.to_i
  end

  def play_turn(type)
    if type == 1
      last_guess = @computer.computer_guess
      result = @computer.computer_breaker(@code_selected, last_guess)
    else
      result = @human.human_breaker(@code_selected)
    end

    result.all?('C')
  end

  def print_result(type)
    if type == 1
      puts @turns.positive? ? COMPUTER_MESSAGES[:winner] : format(COMPUTER_MESSAGES[:loser], turns: TURNS)
    else
      puts @turns.positive? ? HUMAN_MESSAGES[:winner] : format(HUMAN_MESSAGES[:loser], turns: TURNS)
    end
  end
end
