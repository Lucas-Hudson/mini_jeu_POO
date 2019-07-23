require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "------------------------------------------------"
puts "|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |"
puts "|Le but du jeu est d'être le dernier survivant !|"
puts "------------------------------------------------"

puts "Ready to play? Please enter your name:"
print "> "
user_name = gets.chomp
user = HumanPlayer.new(user_name)
player1 = Player.new("José")
player2 = Player.new("Josiane")

enemies = []
enemies << player1 << player2
puts "Welcome #{user_name}!"
puts ""
puts "Careful, 2 ennemies have arrived, José and Josiane. Fight!"
puts ""

while user.life_points > 0 && player1.life_points > 0 || player2.life_points > 0 do

  puts "Here's your status:"
  user.show_state
  puts ""

  puts "What next?"
  puts ""

  puts "w - search for a better weapon"
  puts "h - search for a health pack"
  puts ""

  puts "Attack a player in sight:"
  puts "0 - #{player1.name} has #{player1.life_points} life points."
  puts "1 - #{player2.name} has #{player2.life_points} life points."
  puts ""

  puts "Please enter your input:"
  print "> "
  user_input = gets.chomp

  if user_input == "w"
    user.search_weapon
  elsif user_input == "h"
    user.search_health_pack
  elsif user_input == "0"
    user.attacks(player1)
  elsif user_input == "1"
    user.attacks(player2)
  end

  puts "Watch out! The enemies are retaliating"

  enemies.each do |player|
    if player.life_points > 0
      player.attacks(user)
    end
  end

end

puts ""
puts "-------------------"
puts "|The game is over.|"

  if player1.life_points <= 0 && player2.life_points <= 0
    puts "|You won!!!       |"
    puts "-------------------"
  elsif user.life_points <= 0
    puts "You lost..."
    puts "-------------------"
  end

binding.pry
