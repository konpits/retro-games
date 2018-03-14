# A collection of retro games. Presents games menu and loads games
require_relative 'game_loader'

puts " "
puts " "*57
puts "="*19 + "|" + "  RETRO GAMES  " +  "|" + "="*21
puts " "*57


GameLoader::main_menu(GameLoader::GAMES)