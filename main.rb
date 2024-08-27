require_relative "lib/game.rb"

print "Player 1 enter your user name: "
player1_name = gets.chomp
puts "Player 1 name set to #{player1_name}"

print "Player 2 enter your user name: "
player2_name = gets.chomp
puts "Player 2 name set to #{player2_name}"

puts "\n#{player1_name} vs #{player2_name}!!\n\n"

tic_tac_toe = Game.new(player1_name, player2_name)
tic_tac_toe.play