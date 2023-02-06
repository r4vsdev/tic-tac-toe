class Board
  attr_accessor :available
  attr_reader :matrix, :game_over

  def initialize
    @matrix = [
      ["1", "2", "3"],
      ["4", "5", "6"],
      ["7", "8", "9"],
    ]
    @available = ['1', '2', '3', '4', '5', '6', '7', '8', '9']
    @game_over = false
  end

  def print_it
    # p @matrix[0], @matrix[1], @matrix[2]
    # puts ""
    print @matrix[0][0]
    print "  |  "
    print @matrix[0][1]
    print "  |  "
    puts @matrix[0][2]

    puts "-------------"

    print @matrix[1][0]
    print "  |  "
    print @matrix[1][1]
    print "  |  "
    puts @matrix[1][2]

    puts "-------------"

    print @matrix[2][0]
    print "  |  "
    print @matrix[2][1]
    print "  |  "
    puts @matrix[2][2]
  end

  def get_player_move
    puts ""
    puts 'Choose from 1-9 to make your move'
    @player_move = gets.chomp
    puts ""

    if @available.include?(@player_move)
      @available.delete(@player_move)
      return @player_move
    else
      puts "The position #{@player_move} is already marked, choose another"
      get_player_move
    end
  end

  def get_CPU_move
    if @game_over
      return ""
    end
    if @available.length == 0
      @game_over = true
      return "Draw"
    end
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
    if @game_over == true
      return
    end
    for line in @matrix do
      if line.minmax.reduce(&:eql?)
        @game_over = true
        winner = line[0]
        puts ""
        puts "Game Over, #{winner} won"
        puts ""
        self.print_it
      end
    end
    for line in @matrix.transpose do
      if line.minmax.reduce(&:eql?)
        @game_over = true
        winner = line[0]
        puts ""
        puts "Game Over, #{winner} won"
        puts ""
        self.print_it
      end
    end
    if @matrix[0][0] == @matrix[1][1] && @matrix[1][1] == @matrix[2][2]
      @game_over = true
      winner = @matrix[0][0]
      puts ""
      puts "Game Over, #{winner} won"
      puts ""
      self.print_it
    end
    if @matrix[0][2] == @matrix[1][1] && @matrix[1][1] == @matrix[2][0]
      @game_over = true
      winner = @matrix[0][2]
      puts ""
      puts "Game Over, #{winner} won"
      puts ""
      self.print_it
    end
  end

end

board = Board.new

until board.game_over do
  board.print_it
  player_move = board.get_player_move
  board.mark(player_move, 'player')
  board.is_it_over?
  cpu_move = board.get_CPU_move
  # puts cpu_move
  board.mark(cpu_move, 'cpu')
  board.is_it_over?
end