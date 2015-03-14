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
  erb :'games/index'
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
  @game_id = params[:id]
  erb :'games/game'
end

def scores_to_rankings(scores)
  # descending list of final scores
  uniq_scores = scores.map { |p,s| s }.uniq.sort.reverse

  # `ordered_players` is an array; each element is an array of player ids;
  # ordered_players is sorted such that the players with the highest score are
  # in the first element, etc.
  #
  # For example, if a 4 player game ends with these scores:
  # Player 1: 63
  # Player 2: 45
  # Player 3: 54
  # Player 4: 45
  #
  # the value of `ordered_players` will be [[1], [3], [2, 4]]
  ordered_players = uniq_scores.map do |u|
    scores.select { |_, s| s == u }
  end.map { |o| o.keys }

  # keys: player ids
  # values: ranking points
  rankings = {}

  rank = 1

  ordered_players.each do |players|
    new_rank = rank + players.size
    ranks = (rank..(new_rank - 1)).to_a

    ranking_points = ranks.reduce(&:+) / ranks.size.to_f

    players.each { |p| rankings[p] = ranking_points }

    rank = new_rank
  end

  rankings
end

post '/games/add' do
  # "logging"
  puts "params = #{params}"

  player_count = params[:player_count].to_i

  # base
  game_opts = {
    date: params[:date],
    cities: params[:using_cities] == "on",
    leaders: params[:using_leaders] == "on",
    player_count: player_count
  }

  # scores, used later to calculate rankings
  scores = {}

  # all player info
  (1..player_count).each do |n|
    # name
    player_id = Player.where(name: params[:"player#{n}"]).first.id
    game_opts[:"player#{n}"] = player_id

    # board
    board_name = params[:"board_name_p#{n}"]
    side = params[:"board_side_p#{n}"] == 'on' ? 'A' : 'B'
    board_id = Board.where(name: board_name, side: side).first.id
    game_opts[:"board_p#{n}"] = board_id

    # score categories
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

    scores[n] = params[:"total_p#{n}"]
  end

  rankings = scores_to_rankings(scores)

  (1..player_count).each do |n|
    game_opts[:"ranking_p#{n}"] = rankings[n]
  end

  puts "game_opts = #{game_opts}"

  new_game = Game.create(**game_opts)

  redirect to("/games/#{new_game.id}")
end
