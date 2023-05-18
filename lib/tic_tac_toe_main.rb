# frozen_string_literal: true

require_relative '../lib/tic_tac_toe_board'

board = Board.new

until board.game_over
  board.print_it
  player_move = board.player_move
  board.mark(player_move, 'player')
  board.over?
  cpu_move = board.cpu_move
  board.mark(cpu_move, 'cpu')
  board.over?
end