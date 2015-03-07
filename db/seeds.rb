require './models/board'
require './models/player'

player_list = File.read(File.expand_path('../players.txt', __FILE__)).split("\n")

player_list.each do |player|
  Player.create(name: player)
end

board_list = [
  "Abu Simbel",
  "Alexandria",
  "Babylon",
  "Byzantium",
  "Ephesos",
  "Gizah",
  "Halikarnassos",
  "Manneken Pis",
  "Olympia",
  "Petra",
  "Rhodos",
  "Roma",
  "Stonehenge",
  "The Great Wall"
]

board_list.each do |board|
  Board.create(name: board, side: 'A')
  Board.create(name: board, side: 'B')
end
