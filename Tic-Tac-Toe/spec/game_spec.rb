# frozen_string_literal: true

require_relative '../classes/game'

# Test for game class in Tic-Tac-Toe
RSpec.describe Game do # rubocop:disable Metrics/BlockLength
  subject(:test_game) { described_class.new }

  describe '#put_symbol_in_board' do
    context 'when user enters an empty position' do
      it 'puts the symbol in the position' do
        row = 1
        column = 1
        symbol = 'X'

        test_game.put_symbol_in_board(symbol, row, column)

        expect(test_game.board[row][column]).to eq(symbol)
      end
    end

    before do
      test_game.board[1][1] = 'X'
    end

    context 'when user enters an already taken position' do
      it 'returns an error message' do
        row = 1
        column = 1
        symbol = 'O'
        error_message = 'Error'

        result = test_game.put_symbol_in_board(symbol, row, column)
        expect(result).to eq(error_message)
      end
    end
  end

  describe '#check_board_status' do # rubocop:disable Metrics/BlockLength
    context 'when board is full and there is no winner' do
      before do
        allow(test_game).to receive(:board_filled?).and_return(false)
      end

      it 'returns a draw message' do
        draw_message = "It's a draw!"

        result = test_game.check_board_status
        expect(result).to eq(draw_message)
      end
    end

    context 'when board is not full and there is no winner' do
      before do
        allow(test_game).to receive(:board_filled?).and_return(true)
      end

      it 'returns nil' do
        result = test_game.check_board_status
        expect(result).to be_nil
      end
    end

    context 'when board is not full and there is a winner with a row' do
      before do
        allow(test_game).to receive(:board_filled?).and_return(true)
        allow(test_game).to receive(:three_in_a_row).and_return('X')
      end

      it 'returns a winner message' do
        winner_message = 'X is the winner!'

        result = test_game.check_board_status
        expect(result).to eq(winner_message)
      end
    end

    context 'when board is not full and there is a winner with a column' do
      before do
        allow(test_game).to receive(:board_filled?).and_return(true)
        allow(test_game).to receive(:three_in_a_row).and_return(nil, 'X')
      end

      it 'returns a winner message' do
        winner_message = 'X is the winner!'

        result = test_game.check_board_status
        expect(result).to eq(winner_message)
      end
    end

    context 'when board is not full and there is a winner with a diagonal' do
      before do
        allow(test_game).to receive(:board_filled?).and_return(true)
        allow(test_game).to receive(:three_in_a_row).and_return(nil, nil, 'X')
      end

      it 'returns a winner message' do
        winner_message = 'X is the winner!'

        result = test_game.check_board_status
        expect(result).to eq(winner_message)
      end
    end
  end
end
