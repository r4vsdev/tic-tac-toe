# frozen_string_literal: true

require_relative '../lib/tic_tac_toe_board'

describe Board do
  subject { described_class.new }

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
        subject(:game_first_line) do
          described_class.new([%w[X X X],
                               %w[4 5 6],
                               %w[7 8 9]])
        end
        it 'returns X X X on the first array' do
          expect(game_first_line.matrix_board[0]).to eq(%w[X X X])
        end
      end

      context 'when the second line is specified' do
        subject(:game_second_line) do
          described_class.new([%w[1 2 3],
                               %w[X X X],
                               %w[7 8 9]])
        end
        it 'returns X X X on the second array' do
          expect(game_second_line.matrix_board[1]).to eq(%w[X X X])
        end
      end

      context 'when the third line is specified' do
        subject(:game_third_line) do
          described_class.new([%w[1 2 3],
                               %w[4 5 6],
                               %w[X X X]])
        end
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

  describe '#lines_equal?' do
    context 'when first line is equal' do
      subject { described_class.new([%w[X X X], %w[4 5 6], %w[7 8 9]]) }

      it { should be_lines_equal }
    end

    context 'when second line is equal' do
      subject { described_class.new([%w[1 2 3], %w[X X X], %w[7 8 9]]) }

      it { should be_lines_equal }
    end

    context 'when third line is equal' do
      subject { described_class.new([%w[1 2 3], %w[4 5 6], %w[X X X]]) }

      it { should be_lines_equal }
    end

    context 'when no line is equal' do
      subject { described_class.new }

      it { should_not be_lines_equal }
    end
  end

  describe '#columns_equal?' do
    context 'when first column is equal' do
      subject { described_class.new([%w[X 2 3], %w[X 5 6], %w[X 8 9]]) }

      it { should be_columns_equal }
    end

    context 'when second column is equal' do
      subject { described_class.new([%w[1 X 3], %w[4 X 6], %w[7 X 9]]) }

      it { should be_columns_equal }
    end

    context 'when third column is equal' do
      subject { described_class.new([%w[1 2 X], %w[4 5 X], %w[7 8 X]]) }

      it { should be_columns_equal }
    end

    context 'when no column is equal' do
      it { should_not be_columns_equal }
    end
  end

  describe '#first_diagonal_equal?' do
    context 'when first diagonal is equal' do
      subject { described_class.new([%w[X 2 3], %w[4 X 6], %w[7 8 X]]) }

      it { should be_first_diagonal_equal }
    end

    context 'when second diagonal is equal' do
      subject { described_class.new([%w[1 2 X], %w[4 X 6], %w[X 8 9]]) }

      it { should_not be_first_diagonal_equal }
    end

    context 'when no diagonal is equal' do
      it { should_not be_first_diagonal_equal }
    end
  end

  describe '#second_diagonal_equal?' do
    context 'when second diagonal is equal' do
      subject { described_class.new([%w[1 2 X], %w[4 X 6], %w[X 8 9]]) }

      it { should be_second_diagonal_equal }
    end

    context 'when first diagonal is equal' do
      subject { described_class.new([%w[X 2 3], %w[4 X 6], %w[7 8 X]]) }

      it { should_not be_second_diagonal_equal }
    end

    context 'when no diagonal is equal' do
      it { should_not be_second_diagonal_equal }
    end
  end

  describe '#verify_input' do
    context 'when given a low valid number' do
      it 'returns valid number' do
        valid_number = '1'
        expect(subject.verify_input(valid_number)).to eq('1')
      end
    end

    context 'when given a high valid number' do
      it 'returns valid number' do
        valid_number = '9'
        expect(subject.verify_input(valid_number)).to eq('9')
      end
    end

    context 'when given an invalid number' do
      it 'returns nils' do
        invalid_number = '10'
        expect(subject.verify_input(invalid_number)).to be_nil
      end
    end

    context 'when given a letter' do
      it 'returns nils' do
        letter = 'l'
        expect(subject.verify_input(letter)).to be_nil
      end
    end
  end

  describe '#player_turn' do
    context 'when user input is valid' do
      it 'does not show error message' do
        valid_input = '3'
        allow(subject).to receive(:player_input).and_return(valid_input)
        expect(subject).not_to receive(:puts).with('Input error!')
        subject.player_turn
      end

      it 'calls mark once' do
        valid_input = '3'
        allow(subject).to receive(:player_input).and_return(valid_input)
        expect(subject).to receive(:mark).with(valid_input, 'player').once
        subject.player_turn
      end
    end

    context 'when user input is invalid, then valid' do
      it 'shows error message once' do
        valid_input = '3'
        letter = 'l'
        allow(subject).to receive(:player_input).and_return(letter, valid_input)
        expect(subject).to receive(:puts).with('Input error!').once
        subject.player_turn
      end
    end

    context 'when user input is 2x invalid, then valid' do
      it 'shows error message twice' do
        valid_input = '3'
        letter = 'l'
        invalid_input = '10'
        allow(subject).to receive(:player_input).and_return(letter, invalid_input, valid_input)
        expect(subject).to receive(:puts).with('Input error!').twice
        subject.player_turn
      end
    end
  end

  describe '#cpu_turn' do
    context 'when the chosen input is valid' do
      it 'calls mark once' do
        valid_input = '4'
        allow(subject).to receive(:verify_input).and_return(valid_input)
        expect(subject).to receive(:mark).with(valid_input, 'CPU').once
        subject.cpu_turn
      end

      it 'deletes cpu_move from @available array' do
        valid_input = '4'
        allow(subject).to receive(:verify_input).and_return(valid_input)
        allow(subject).to receive(:available).and_return(%w[1 2 4])
        expect(subject.available.delete(valid_input)).to eq(valid_input)
        subject.cpu_turn
      end
    end
  end

  describe '#mark' do
    subject { described_class.new }

    context 'when valid input is given by the player' do
      it 'marks X on the given input' do
        valid_input = '1'
        initial_board = [%w[1 2 3], %w[4 5 6], %w[7 8 9]]
        changed_board = [%w[X 2 3], %w[4 5 6], %w[7 8 9]]
        expect do
          subject.mark(valid_input, 'player')
        end.to change { subject.matrix_board }.from(initial_board).to(changed_board)
      end
    end

    context 'when valid input is given by the CPU' do
      it 'marks O on the given input' do
        valid_input = '3'
        initial_board = [%w[1 2 3], %w[4 5 6], %w[7 8 9]]
        changed_board = [%w[1 2 O], %w[4 5 6], %w[7 8 9]]
        expect do
          subject.mark(valid_input, 'CPU')
        end.to change { subject.matrix_board }.from(initial_board).to(changed_board)
      end
    end
  end

  describe '#final_message' do
    context 'when the player wins' do
      subject { described_class.new([%w[X X X], %w[4 5 6], %w[7 8 9]], winner = 'Player') }

      it 'outputs the correct phrase' do
        winning_phrase = "Congratulations! You Won! =)\n"
        expect { subject.final_message }.to output(winning_phrase).to_stdout
      end
    end

    context 'when the CPU wins' do
      subject { described_class.new([%w[O O O], %w[4 5 6], %w[7 8 9]], winner = 'CPU') }

      it 'outputs the correct phrase' do
        losing_phrase = "That is sad! The CPU Won =(\n"
        expect { subject.final_message }.to output(losing_phrase).to_stdout
      end
    end

    context 'when there is no winner' do
      subject { described_class.new([%w[1 2 3], %w[4 5 6], %w[7 8 9]]) }

      it 'outputs the correct phrase' do
        expect { subject.final_message }.to output("Seens like we ran out of moves.\n").to_stdout
      end
    end
  end
end
