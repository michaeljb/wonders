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

get '/games/' do
  "All the games"
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
  @default_players = 3
  erb :'games/add'
end

get '/games/:id' do
  "Game ##{params[:id]}"
end

post '/games/add' do
  # "logging"
  puts params

  player_count = params[player_count].to_i

  # base
  game_opts = {
    date: params[:date],
    cities: params[:using_cities] == "on",
    leaders: params[:using_leaders] == "on",
    player_count: player_count
  }

  # all player info
  (1..player_count).each do |n|
    # name
    game_opts[:"player#{n}"] = Player.where(name: params[:name]).first.id

    # board
    board_name = params[:"board_name_p#{n}"]
    side = params[:"board_side_p#{n}"]
    board_id = Board.where(name: board_name, side: side).first.id
    game_opts[:"board_p#{n}"] = board_id

    # scores
    %w(
      military
      treasury
      wonder
      civilian
      science
      commercial
      guilds
      leaders
      city
      total
    ).each do |score|
      sym = :"#{score}_p#{n}"
      game_opts[sym] = params[sym].to_i
    end
  end

  new_game = Game.create(**game_opts)

  redirect to("/games/#{new_game.id}")
end
