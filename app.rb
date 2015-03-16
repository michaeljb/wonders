require 'sinatra'
require 'sinatra/activerecord'
require './config/environments'
require './models/board'
require './models/game'
require './models/player'
require './models/standings2p'
require './models/standings3p'
require './models/standings4p'
require './models/standings5p'
require './models/standings6p'
require './models/standings7p'
require './models/standings8p'

get '/' do
  @players = Player.all
  @boards = Board.all

  @standings = {}

  (2..8).each do |n|
    @standings[n] = Object.const_get("Standings#{n}P").all
  end

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
    'Guilds',
    'Science Structures'
  ]
  @default_players = 3
  erb :'games/add'
end

get '/games/:id' do
  @game = Game.find(params[:id].to_i)

  @player_count = @game.player_count

  @players = {}
  @boards = {}
  @rankings = []

  (1..@game.player_count).map do |p|
    @players[p] = Player.find(@game[:"player#{p}"]).name

    board_id = @game[:"board_p#{p}"]

    unless board_id.nil?
      board = Board.find(board_id)
      @boards[p] = "#{board.name} #{board.side}"
    end

    @rankings.push(player: @players[p], points: @game[:"ranking_p#{p}"])
  end

  # sort so that fewest ranking points is first, tie goes to alphabetical
  #@rankings.sort
  @rankings.sort! do |a, b|
    [a[:points], a[:player]] <=> [b[:points], b[:player]]
  end

  @scoring_categories = [
    'Military Conflicts',
    'Treasury/Debt',
    'Wonder',
    'Civilian Structures',
    'Commercial Structures',
    'Guilds',
    'Science Structures'
  ]

  erb :'games/id'
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

  # key: player N in the game
  # value: player ID in the Player table
  player_ids = {}

  # all player info
  (1..player_count).each do |n|
    # name
    player_id = Player.where(name: params[:"player#{n}"]).first.id
    game_opts[:"player#{n}"] = player_id

    player_ids[n] = player_id

    # board
    board_name = params[:"board_name_p#{n}"]
    side = params[:"board_side_p#{n}"] == 'on' ? 'A' : 'B'

    board = Board.where(name: board_name, side: side).first

    unless board.nil?
      board_id = board.id
      game_opts[:"board_p#{n}"] = board_id
    end

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
  puts "rankings = #{rankings}"

  (1..player_count).each do |n|
    game_opts[:"ranking_p#{n}"] = rankings[n]
  end

  puts "game_opts = #{game_opts}"

  new_game = Game.create(**game_opts)

  # update records for each player in the appropriate Standings table

  puts "getting the standings table..."
  standings_table = Object.const_get("Standings#{player_count}P")
  puts "got table #{standings_table.table_name}"

  player_ids.each do |player_n, player_id|
    puts "\n\nupdate info for player #{player_id} (Player id, not seat number)"

    player_stats = standings_table.find_by(player: player_id)

    # need to add a row to the table
    if player_stats.nil?
      puts "no entries for this player in #{player_count}-player yet, creating entry"

      init_player_stats = {
        player: player_id,
        games_played: 0,
        ranking_avg: 0.0
      }


      standings_table.column_names.select { |c| c =~ /^[0-9]/ }.each do |col|
        init_player_stats[col] = 0
      end

      puts "creating entry for player #{player_id} in Standings#{player_count}P with inital stats: #{init_player_stats}"
      player_stats = standings_table.create(init_player_stats)
    end

    puts "player_stats = #{player_stats}"

    # update the table

    puts "increasing games played from #{player_stats[:games_played]} by 1..."
    player_stats.update(games_played: player_stats[:games_played] + 1)

    column = :"#{rankings[player_n]}"

    puts "increasing appropriate rankings column (:#{column}) by 1..."
    player_stats.update(column => player_stats[column] + 1)

    puts "calculating new average ranking points..."
    sum = standings_table.column_names.select { |c| c =~ /^[0-9]/ }.reduce(0) do |sum, n|
      sum + (player_stats[n] * n.to_f)
    end
    avg = sum.to_f / player_stats[:games_played]

    puts "updating average ranking column"
    player_stats.update(ranking_avg: avg)

    puts "done updating standings table for player #{player_id}\n\n"
  end

  redirect to("/games/#{new_game.id}")
end
