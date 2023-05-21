# frozen_string_literal: true

require_relative '../lib/tic_tac_toe_board'


describe Board do
  describe '#initialize' do
    context 'when matrix_board is initialized on default' do
      subject(:board) { described_class.new }

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

    context 'when given a specific board' do
      context 'when the first line is specified' do
        subject(:game_first_line) { described_class.new([ %w[X X X], 
                                                          %w[4 5 6], 
                                                          %w[7 8 9] ]) }
        it 'returns X X X on the first array' do
          expect(game_first_line.matrix_board[0]).to eq(%w[X X X])
        end
      end

      context 'when the second line is specified' do
        subject(:game_second_line) { described_class.new([%w[1 2 3], 
                                                          %w[X X X], 
                                                          %w[7 8 9] ]) }
        it 'returns X X X on the second array' do
          expect(game_second_line.matrix_board[1]).to eq(%w[X X X])
        end
      end

      context 'when the third line is specified' do
        subject(:game_third_line) { described_class.new([%w[1 2 3], 
                                                         %w[4 5 6], 
                                                         %w[X X X] ]) }
        it 'returns X X X on the third array' do
          expect(game_third_line.matrix_board[2]).to eq(%w[X X X])
        end
      end


    end
  end

  describe '#game_over?' do
    
    subject { described_class.new }
    
    context 'when there are no more moves available' do
      before do
        allow(subject.available).to receive(:empty?).and_return(true)
        allow(subject).to receive(:lines_equal?).and_return(false)
        allow(subject).to receive(:columns_equal?).and_return(false)
        allow(subject).to receive(:first_diagonal_equal?).and_return(false)
        allow(subject).to receive(:second_diagonal_equal?).and_return(false)
      end
      
      it { should be_game_over }
    end

    context 'when one of the lines is equal' do
      before do
        allow(subject.available).to receive(:empty?).and_return(false)
        allow(subject).to receive(:lines_equal?).and_return(true)
        allow(subject).to receive(:columns_equal?).and_return(false)
        allow(subject).to receive(:first_diagonal_equal?).and_return(false)
        allow(subject).to receive(:second_diagonal_equal?).and_return(false)
      end

      it { should be_game_over }
    end

    context 'when one of the columns is equal' do
      before do
        allow(subject.available).to receive(:empty?).and_return(false)
        allow(subject).to receive(:lines_equal?).and_return(false)
        allow(subject).to receive(:columns_equal?).and_return(true)
        allow(subject).to receive(:first_diagonal_equal?).and_return(false)
        allow(subject).to receive(:second_diagonal_equal?).and_return(false)
      end

      it { should be_game_over }
    end

    context 'when first diagonal is equal' do
      before do
        allow(subject.available).to receive(:empty?).and_return(false)
        allow(subject).to receive(:lines_equal?).and_return(false)
        allow(subject).to receive(:columns_equal?).and_return(false)
        allow(subject).to receive(:first_diagonal_equal?).and_return(true)
        allow(subject).to receive(:second_diagonal_equal?).and_return(false)
      end

      it { should be_game_over }
    end

    context 'when second diagonal is equal' do
      before do
        allow(subject.available).to receive(:empty?).and_return(false)
        allow(subject).to receive(:lines_equal?).and_return(false)
        allow(subject).to receive(:columns_equal?).and_return(false)
        allow(subject).to receive(:first_diagonal_equal?).and_return(false)
        allow(subject).to receive(:second_diagonal_equal?).and_return(true)
      end

      it { should be_game_over }
    end
  end

end