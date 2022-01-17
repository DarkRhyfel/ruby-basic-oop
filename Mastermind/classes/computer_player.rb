# frozen_string_literal: true

# Computer player module
class ComputerPlayer
  include GameLogic
  include TextContents

  def computer_maker
    puts COMPUTER_MESSAGES[:select]
    CODE_PEG_COLORS.sample(4)
  end

  def computer_guess
    if @last_guess.nil?
      @last_guess = CODE_PEG_COLORS.sample(4)
      @unselected_pegs = CODE_PEG_COLORS.difference(@last_guess)
    else
      change_peg(@last_guess.zip(@result))
    end

    @last_guess
  end

  def computer_breaker(code_selected, last_guess)
    puts format(COMPUTER_MESSAGES[:guess], guess: last_guess)

    @result = compare_guess(code_selected, last_guess)
    puts format(COMPUTER_MESSAGES[:result], results: @result)

    @result
  end

  private

  def change_peg(results)
    if @result.any?('X')
      @last_guess = results.map { |peg, result| result == 'X' ? @unselected_pegs.pop : peg }
      @result = @result.map { |result| result == 'X' ? 'P' : result }
    end

    correct_count = @result.count('P')

    next_guess(results, correct_count)
  end

  def next_guess(results, count)
    case count
    when 4
      @last_guess = permutate_pegs
    when 3
      correct_index = results.index { |_, result| result == 'C' }
      @last_guess = permutate_pegs(@last_guess[correct_index], correct_index)
    when 2
      switch_pegs
    end
  end

  def permutate_pegs(peg = nil, index = -1)
    permutations = []

    @last_guess.permutation(4) { |pegs| permutations.append(pegs) }

    if index >= 0 && !peg.nil?
      (permutations.select { |permutation| permutation[index] == peg }).sample
    else
      permutations.sample
    end
  end

  def switch_pegs
    indices = @result.each_index.select { |i| @result[i] == 'P' }
    @last_guess[indices[0]], @last_guess[indices[1]] = @last_guess[indices[1]], @last_guess[indices[0]]
  end
end
