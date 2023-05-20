# frozen_string_literal: true

require_relative '../lib/tic_tac_toe_board'


describe Board do
  context 'when the player wins' do
    describe '#over?' do

      subject(:board) { described_class.new }

      it 'works with first row' do
        allow(board).to receive(:lines_equal).and_return(true)
        expect(board.game_over).to be_true
      end

      xit 'works with second row' do
        
      end

      xit 'works with third row' do
        
      end

      xit 'works with first column' do
        
      end

      xit 'works with second column' do
        
      end

      xit 'works with third column' do
        
      end

      xit 'works with main diagonal' do
        
      end

      xit 'works with secondary diagonal' do
        
      end
    end


  end
end