# frozen_string_literal: true

class Board
  attr_accessor :available
  attr_reader :matrix

  def initialize
    @matrix = [
      %w[1 2 3],
      %w[4 5 6],
      %w[7 8 9]
    ]
    @available = %w[1 2 3 4 5 6 7 8 9]
  end

  def player_turn
    loop do
      @guess = verify_input(player_input)
      break if @guess

      puts 'Input error!'
    end
  end

  def verify_input(number)
    return number if number.match?(/^[1-9]$/)
  end

  def player_input
    puts 'Choose a digit between 0 and 9'
    gets.chomp
  end

  def play_game
    intro
    print_board
    turn_order until game_over?
    final_message
  end

  def turn_order
    player_turn
    cpu_turn
  end

  def play_game
    until game_over?
      print_board
      player_move = player_move
      mark(player_move, 'player')
      over?
      cpu_move = cpu_move
      mark(cpu_move, 'cpu')
      over?
    end
  end

  def player_move
    puts 'Choose from 1-9 to make your move'
    @player_move = gets.chomp
    if @available.include?(@player_move)
      @available.delete(@player_move)
      @player_move
    else
      puts "The position #{@player_move} is already marked, choose another"
      player_move
    end
  end

  def cpu_move
    return '' if @game_over

    @cpu_move = @available.sample
    @available.delete(@cpu_move)
    @cpu_move
  end

  def mark(move, gamer)
    marker = gamer == 'player' ? 'X' : 'O'

    @matrix.each do |line|
      if line.include?(move)
        move_index = line.find_index(move)
        line[move_index] = marker
      end
    end
  end

  def over?
    return if @game_over == true

    if @available.empty?
      @game_over = true
      return 'Draw'
    end
    lines_equal?
    columns_equal?
    first_diagonal_equal?
    second_diagonal_equal?
  end

  private

  def final_message
    puts 'This is the final message'
  end

  def intro
    puts 'Lets play tic tac toe'
    puts 'The game ends whenever we have the same pattern in any direction'
  end

  def print_board
    print_line(0)
    print_line(1)
    print_line(2)
  end

  def print_line(num)
    print @matrix[num][0], '  |  ', @matrix[num][1], '  |  '
    puts @matrix[num][2], '-------------'
  end

  def first_diagonal_equal?
    return unless @matrix[0][0] == @matrix[1][1] && @matrix[1][1] == @matrix[2][2]

    @game_over = true
    winner = @matrix[0][0]
    puts '', "Game Over, #{winner} won", ''
    print_board
  end

  def second_diagonal_equal?
    return unless @matrix[0][2] == @matrix[1][1] && @matrix[1][1] == @matrix[2][0]

    @game_over = true
    winner = @matrix[0][2]
    puts '', "Game Over, #{winner} won", ''
    print_board
  end

  def lines_equal?
    @matrix.each do |line|
      next unless line.minmax.reduce(&:eql?)

      @game_over = true
      winner = line[0]
      puts '', "Game Over, #{winner} won", ''
      print_board
    end
  end

  def columns_equal?
    @matrix.transpose.each do |line|
      next unless line.minmax.reduce(&:eql?)

      @game_over = true
      winner = line[0]
      puts '', "Game Over, #{winner} won", ''
      print_board
    end
  end
end