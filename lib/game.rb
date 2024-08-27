require_relative "player.rb"

class Game
  @@LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]

    def initialize(player1, player2)
      @board = Array.new(10)
      @current_player_id = 0
      @players = [Player.new(player1, "X"), Player.new(player2, "O")]
      puts "The starting players turn is #{current_player}"
      display_board
    end
    attr_reader :board, :current_player_id

    def play

      loop do
        place_player_marker(current_player)

        
        if player_has_won?
          puts "\n#{current_player} wins!"
          display_board
          return
        elsif board_full?
          puts "\nIt's a draw!"
          display_board
          return
        end

        switch_players!
      end

    end

    def place_player_marker(player)
      print "#{current_player} please select a location to mark: "


      loop do
        marker_number = gets.chomp.to_i
        if free_positions.include?(marker_number)
          puts "You've selected #{marker_number}"
          @board[marker_number] = player.get_player_marker
          player.add_marker(marker_number)
          display_board
          return
        else
          display_board
          print "Position #{marker_number} is taken or not avaliable, please try again: "
        end
      end
    end

    def current_player
      @players[@current_player_id]
    end

    def free_positions
      (1..9).select { |positions| @board[positions].nil? }
    end

    def opponent
      @players[opposing_player_id]
    end

    def switch_players!
      @current_player_id = opposing_player_id
    end

    def opposing_player_id
      1 - @current_player_id
    end

    def get_board_data
      new_board = []
      (1..9).each do |index| 
        if free_positions.include?(index)
          new_board << index
        else
          new_board << @board[index]
        end
      end
      new_board
    end

    def row_numbers(row)
      board_data = get_board_data
      index = 0
      if row == 1
        index = 3
      elsif row == 2
        index = 6
      end
      "#{board_data[index]} | #{board_data[index+1]} | #{board_data[index+2]}"
    end

    def display_board
      row_seperator = "--|---|--"
      lines_row = 0
      5.times do |index|
       if index.even?
        puts row_numbers(lines_row)
        lines_row += 1
       else
        puts row_seperator
       end
      end 
    end

    def board_full?
      free_positions.empty?
    end

    def player_has_won?
      @@LINES.each do |win_row|
        if win_row.all? { |num| current_player.get_player_marker_locations.include?(num)}
          return true
        end
      end
      false
    end

end
  