require_relative "lib/game"
puts "Enter name for Player 'X' "
name1 = gets.chomp

puts "Enter name for Player 'Y' "
name2 = gets.chomp
Game.new(name1,name2).play
