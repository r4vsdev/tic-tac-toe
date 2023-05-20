# frozen_string_literal: true

require_relative '../lib/tic_tac_toe_board'


describe Board do
  describe '#initialize' do
    subject(:board) { described_class.new }

    context 'when matrix_board is initialized' do
      it 'is a matrix containing 3 arrays' do
        expect(board.matrix_board.size).to eq(3)
      end

      it 'contains 9 elements' do
        expect(board.matrix_board.flatten.size).to eq(9)
      end

      it 'contains only strings' do
        expect(board.matrix_board.flatten).to all(be_a(String))
      end
    end
  end
end