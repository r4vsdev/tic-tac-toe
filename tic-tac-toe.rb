require "matrix"


# inicia o board
#   printa na tela as  3 linhas separadas
# pega a jogada do player
# marca no board
# pega jogada da cpu
# marca no board



class Board
  attr_reader :first_line, :second_line, :third_line  #, :first_row, :second_row, :third_row
  def initialize
    @first_line  = [1, 2, 3]
    @second_line = [4, 5, 6]
    @third_line  = [7, 8, 9]
  end

  def get_player_move
    puts 'Choose from 1-9 to make your move'
    @player_move = gets.chomp
    return @player_move
  end

  # def get_CPU_move
  #   cpu_move =  rand(1..9)
  # end

  # def mark_player_move(move)
  #   if move.between?(1,3)
  #     move_index = board.firstline.find_index(move)
  #     board.first_line[move_index] = 'X'
  #   end
  #   # puts 'marked player move'
  # end

end


board = Board.new

p board.first_line, board.second_line, board.third_line
player_move = board.get_player_move
# p player_move



# @first_line  = [1, 2, 3]
# @second_line = [4, 5, 6]
# @third_line  = [7, 8, 9]

# @first_row = [@first_line[0], @second_line[0], @third_line[0]]
# @second_row = [@first_line[1], @second_line[1], @third_line[1]]
# @third_row = [@first_line[2], @second_line[2], @third_line[2]]

# @diagonal1 = [@first_line[0], @second_line[1], third_line[2]]
# @diagonal2 = [@first_line[2], @second_line[1], third_line[0]]