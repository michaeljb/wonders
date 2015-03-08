require 'sinatra'
require 'sinatra/activerecord'
require './config/environments'
require './models/board'
require './models/game'
require './models/player'

get '/' do
  @players = Player.all
  @boards = Board.all
  @title = 'Welcome'

  erb :index
end

get '/games/add' do
  @player_names = Player.order('name').map { |p| p.name }.uniq
  @board_names = Board.order('name').map { |b| b.name }.uniq
  @scoring_categories = [
    'Military Conflicts',
    'Treasury/Debt',
    'Wonder',
    'Civilian Structures',
    'Commercial Structures',
    'Science Structures',
    'Guilds'
  ]
  erb :'games/add'
end
