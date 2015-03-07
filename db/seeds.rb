require './models/player'

player_list = File.read(File.expand_path('../players.txt', __FILE__)).split("\n")

player_list.each do |player|
  Player.create({"name" => player})
end
