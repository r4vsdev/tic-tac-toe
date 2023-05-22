# frozen_string_literal: true

class Board
  attr_accessor :available
  attr_reader :matrix_board

  def initialize(matrix_board = [ %w[1 2 3],
                                  %w[4 5 6],
                                  %w[7 8 9] ])
    @matrix_board = matrix_board
    @available = %w[1 2 3 4 5 6 7 8 9]
  end

  def play_game
    intro
    print_board
    turn_order until game_over?
    final_message
  end

  def turn_order
    player_turn
    if game_over?
      return 'Player won'
    else
      print_board
    end
    cpu_turn
  end
  
  def player_turn
    loop do
      player_move = verify_input(player_input)
      if player_move
        mark(player_move, 'player')
        @available.delete(player_move)
        break
      end

      puts 'Input error!'
    end
  end

  def verify_input(number)
    return number if number.match?(/^[1-9]$/) && @available.include?(number)
  end

  def cpu_turn
    cpu_move = verify_input(@available.sample)
    mark(cpu_move, 'CPU')
    @available.delete(cpu_move)
  end


# TO DO: TESTAR O JOGO AMANHA
  # def play_game
  #   until game_over?
  #     print_board
  #     player_move = player_move
  #     mark(player_move, 'player')
  #     game_over?
  #     cpu_move = cpu_move
  #     mark(cpu_move, 'cpu')
  #     game_over?
  #   end
  # end

  # def player_move
  #   puts 'Choose from 1-9 to make your move'
  #   @player_move = gets.chomp
  #   if @available.include?(@player_move)
  #     @available.delete(@player_move)
  #     @player_move
  #   else
  #     puts "The position #{@player_move} is already marked, choose another"
  #     player_move
  #   end
  # end

  # def cpu_move
  #   return '' if @game_over

  #   @cpu_move = @available.sample
  #   @available.delete(@cpu_move)
  #   @cpu_move
  # end

  def mark(move, gamer)
    marker = gamer == 'player' ? 'X' : 'O'

    @matrix_board.each do |line|
      if line.include?(move)
        move_index = line.find_index(move)
        line[move_index] = marker
      end
    end
  end

  def game_over?
    [
      available.empty?, 
      lines_equal?, 
      columns_equal?, 
      first_diagonal_equal?, 
      second_diagonal_equal?
    ].any?
  end

  # private

  def player_input
    puts ''
    puts 'Choose a digit between 0 and 9'
    gets.chomp
  end

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
    print @matrix_board[num][0], '  |  ', @matrix_board[num][1], '  |  '
    puts @matrix_board[num][2]
    return if num == 2
    puts '-------------'
  end

  def all_equal?(arr)
    arr.uniq.size <= 1
  end

  def lines_equal?
    @matrix_board.each do |line|
      return true if all_equal?(line)
    end
    return false
  end

  def columns_equal?
    @matrix_board.transpose.each do |line|
      return true if all_equal?(line)
    end
    return false
  end

  def first_diagonal_equal?
    @matrix_board[0][0] == @matrix_board[1][1] && @matrix_board[1][1] == @matrix_board[2][2] ? true : false
  end

  def second_diagonal_equal?
    @matrix_board[0][2] == @matrix_board[1][1] && @matrix_board[1][1] == @matrix_board[2][0] ? true : false
  end


end