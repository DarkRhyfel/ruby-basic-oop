# frozen-string-literal: true

# Text Content module
module TextContents
  COMMON_MESSAGES = {
    welcome: "Welcome to MasterMind! Let's play a game",
    human_guess: "\nPlease enter your guess separated by a comma (,)",
    check_result: 'Your guess results were %<results>s'
  }.freeze

  RESULT_MESSAGES = {
    winner: "\nCongratulations, you broke the code!",
    loser: "\nSorry, you couldn't break the code in %<turns>d turns. You lose."
  }.freeze
end
