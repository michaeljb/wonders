require 'sinatra'
require 'sinatra/activerecord'
require './config/environments'
require './models/board'
require './models/player'

get '/' do
  @players = Player.all
  @boards = Board.all
  @title = 'Welcome'
  "#{@title}<br><br>players: #{(@players || []).map { |p| p.name }.join(' ')}<br><br>boards: #{(@boards || []).map { |b| "#{b.name} #{b.side}" }.join(' ')}"
end
