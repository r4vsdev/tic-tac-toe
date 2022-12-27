require "matrix"

# inicia o board
#   printa na tela as  3 linhas separadas
# pega a jogada do player
# marca no board
# pega jogada da cpu
# marca no board

class Board
  attr_accessor :first_line, :second_line, :third_line  #, :first_row, :second_row, :third_row
  def initialize
    @first_line  = ["1", "2", "3"]
    @second_line = ["4", "5", "6"]
    @third_line  = ["7", "8", "9"]
    @game_over = false
  end

  def print
    p first_line, second_line, third_line
  end

  def get_player_move
    puts 'Choose from 1-9 to make your move'
    @player_move = gets.chomp
  end

  def get_CPU_move
    @cpu_move =  rand(1..3).to_s
  end

  def mark(move, gamer)
    gamer == 'player' ? marker = 'X' : marker = 'O'
    if @first_line.include?(move)
      move_index = @first_line.find_index(move)
      @first_line[move_index] = marker
    end

    if @second_line.include?(move)
      move_index = @second_line.find_index(move)
      @second_line[move_index] = marker
    end

    if @third_line.include?(move)
      move_index = @third_line.find_index(move)
      @third_line[move_index] = marker
    end
  end

end

board = Board.new

board.print

player_move = board.get_player_move
board.mark(player_move, 'player')

board.print

cpu_move = board.get_CPU_move
board.mark(cpu_move, 'cpu')
p cpu_move

board.print


# until @game_over do
  # board.print
  # player_move = board.get_player_move
  # board.mark(player_move, 'player')
  # cpu_move = board.get_CPU_move
  # board.mark(cpu_move, 'cpu')
# end

# @first_row = [@first_line[0], @second_line[0], @third_line[0]]
# @second_row = [@first_line[1], @second_line[1], @third_line[1]]
# @third_row = [@first_line[2], @second_line[2], @third_line[2]]

# @diagonal1 = [@first_line[0], @second_line[1], third_line[2]]
# @diagonal2 = [@first_line[2], @second_line[1], third_line[0]]