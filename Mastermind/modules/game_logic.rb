# frozen_string_literal: true

# GameLogic module
module GameLogic
  CODE_PEG_COLORS = %w[yellow blue red green purple orange].freeze
  KEY_PEG_SYMBOLS = %w[C P X].freeze
  TURNS = 12

  def compare_guess(code_selected, guess_colors)
    code_selected
      .zip(guess_colors)
      .map { |code, guess| compare_peg(code_selected, code, guess) }
  end

  def compare_peg(code_selected, code, guess)
    if code == guess
      KEY_PEG_SYMBOLS[0]
    elsif code_selected.include?(guess)
      KEY_PEG_SYMBOLS[1]
    else
      KEY_PEG_SYMBOLS[2]
    end
  end
end
