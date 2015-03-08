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
  erb :'games/add'
end
