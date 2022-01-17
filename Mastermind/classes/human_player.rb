# frozen_string_literal: true

# Human player module
class HumanPlayer
  include GameLogic
  include TextContents

  def human_maker
    puts HUMAN_MESSAGES[:select]
    gets.chomp.split(',').map(&:strip)
  end

  def human_breaker(code_selected)
    puts HUMAN_MESSAGES[:guess]
    guess = gets.chomp.split(',').map(&:strip)

    result = compare_guess(code_selected, guess)
    puts format(HUMAN_MESSAGES[:result], results: result)

    result
  end
end
