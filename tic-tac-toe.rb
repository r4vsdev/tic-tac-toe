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
    @first_line  = [1, 2, 3]
    @second_line = [4, 5, 6]
    @third_line  = [7, 8, 9]
  end

  def get_player_move
    puts 'Choose from 1-9 to make your move'
    @player_move = gets.chomp.to_i
  end

  def mark_player_move(move)
    if @first_line.include?(move)
      move_index = @first_line.find_index(move)
      @first_line[move_index] = 'X'
    end
    # puts 'marked player move'
  end

  # def get_CPU_move
  #   cpu_move =  rand(1..9)
  # end

end

board = Board.new
p board.first_line, board.second_line, board.third_line
player_move = board.get_player_move
board.mark_player_move(player_move)
p board.first_line



# @first_row = [@first_line[0], @second_line[0], @third_line[0]]
# @second_row = [@first_line[1], @second_line[1], @third_line[1]]
# @third_row = [@first_line[2], @second_line[2], @third_line[2]]

# @diagonal1 = [@first_line[0], @second_line[1], third_line[2]]
# @diagonal2 = [@first_line[2], @second_line[1], third_line[0]]