require 'sinatra'
require 'sinatra/activerecord'
require './config/environments'
require './models/player'

get '/' do
  @players = Player.all
  @title = 'Welcome'
  "#{@title}\n\n#{@players.map { |p| p.name }.join(' ')}"
end
