# frozen-string-literal: true

# Text Content module
module TextContents
  COMMON_MESSAGES = {
    welcome: "Welcome to MasterMind! Let's play a game.",
    type: "Please enter '1' to play as the Codemaker or '2' to play as the Codebreaker."
  }.freeze

  COMPUTER_MESSAGES = {
    select: "\nThe computer has selected the code.",
    guess: "\nComputer's guess was %<guess>s.",
    result: "Computer's guess results were %<results>s.",
    winner: "\nSorry, the computer broke your code!",
    loser: "\nCongratulations, the computer couldn't break your code in %<turns>d turns."
  }.freeze

  HUMAN_MESSAGES = {
    select: "\nPlease enter your code selection separated by a comma (,).",
    guess: "\nPlease enter your guess separated by a comma (,).",
    result: 'Your guess results were %<results>s.',
    winner: "\nCongratulations, you broke the code!",
    loser: "\nSorry, you couldn't break the code in %<turns>d turns. You lose."
  }.freeze
end
