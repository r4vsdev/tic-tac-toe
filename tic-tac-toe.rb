class Board
  attr_accessor :available
  attr_reader :first_line, :second_line, :third_line, :matrix

  def initialize
    @matrix = [
      ["1", "2", "3"],
      ["4", "5", "6"],
      ["7", "8", "9"],
    ]
    @first_line  = @matrix[0]
    @second_line = @matrix[1]
    @third_line  = @matrix[2]
    @available = ['1', '2', '3', '4', '5', '6', '7', '8', '9']
    @game_over = false
  end

  def print
    p first_line, second_line, third_line
  end

  def get_player_move
    puts 'Choose from 1-9 to make your move'
    @player_move = gets.chomp

    if @available.include?(@player_move)
      @available.delete(@player_move)
      return @player_move
    else
      puts "The position #{@player_move} is already marked, choose another"
      get_player_move
    end
  end

  def get_CPU_move
    @cpu_move = @available.sample
    @available.delete(@cpu_move)
    return @cpu_move
  end

  def mark(move, gamer)
    gamer == 'player' ? marker = 'X' : marker = 'O'

    for line in @matrix do
      if line.include?(move)
        move_index = line.find_index(move)
        line[move_index] = marker
      end
    end
  end

  def is_it_over?
    # if @first_line == Array.new(3, "X") || @first_line == Array.new(3, "O")

  end
end

board = Board.new

until @game_over do
  board.print
  player_move = board.get_player_move
  board.mark(player_move, 'player')
  cpu_move = board.get_CPU_move
  p cpu_move
  board.mark(cpu_move, 'cpu')
end

# @first_row = [@first_line[0], @second_line[0], @third_line[0]]
# @second_row = [@first_line[1], @second_line[1], @third_line[1]]
# @third_row = [@first_line[2], @second_line[2], @third_line[2]]

# @diagonal1 = [@first_line[0], @second_line[1], third_line[2]]
# @diagonal2 = [@first_line[2], @second_line[1], third_line[0]]