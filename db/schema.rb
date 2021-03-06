# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150315204527) do

  create_table "boards", force: :cascade do |t|
    t.string "name"
    t.string "side", limit: 1
  end

  create_table "games", force: :cascade do |t|
    t.date    "date"
    t.integer "player_count"
    t.boolean "cities"
    t.boolean "leaders"
    t.integer "player1"
    t.float   "ranking_p1"
    t.integer "board_p1"
    t.integer "military_p1"
    t.integer "treasury_p1"
    t.integer "wonder_p1"
    t.integer "civilian_p1"
    t.integer "science_p1"
    t.integer "commercial_p1"
    t.integer "guilds_p1"
    t.integer "leaders_p1"
    t.integer "city_p1"
    t.integer "total_p1"
    t.integer "player2"
    t.float   "ranking_p2"
    t.integer "board_p2"
    t.integer "military_p2"
    t.integer "treasury_p2"
    t.integer "wonder_p2"
    t.integer "civilian_p2"
    t.integer "science_p2"
    t.integer "commercial_p2"
    t.integer "guilds_p2"
    t.integer "leaders_p2"
    t.integer "city_p2"
    t.integer "total_p2"
    t.integer "player3"
    t.float   "ranking_p3"
    t.integer "board_p3"
    t.integer "military_p3"
    t.integer "treasury_p3"
    t.integer "wonder_p3"
    t.integer "civilian_p3"
    t.integer "science_p3"
    t.integer "commercial_p3"
    t.integer "guilds_p3"
    t.integer "leaders_p3"
    t.integer "city_p3"
    t.integer "total_p3"
    t.integer "player4"
    t.float   "ranking_p4"
    t.integer "board_p4"
    t.integer "military_p4"
    t.integer "treasury_p4"
    t.integer "wonder_p4"
    t.integer "civilian_p4"
    t.integer "science_p4"
    t.integer "commercial_p4"
    t.integer "guilds_p4"
    t.integer "leaders_p4"
    t.integer "city_p4"
    t.integer "total_p4"
    t.integer "player5"
    t.float   "ranking_p5"
    t.integer "board_p5"
    t.integer "military_p5"
    t.integer "treasury_p5"
    t.integer "wonder_p5"
    t.integer "civilian_p5"
    t.integer "science_p5"
    t.integer "commercial_p5"
    t.integer "guilds_p5"
    t.integer "leaders_p5"
    t.integer "city_p5"
    t.integer "total_p5"
    t.integer "player6"
    t.float   "ranking_p6"
    t.integer "board_p6"
    t.integer "military_p6"
    t.integer "treasury_p6"
    t.integer "wonder_p6"
    t.integer "civilian_p6"
    t.integer "science_p6"
    t.integer "commercial_p6"
    t.integer "guilds_p6"
    t.integer "leaders_p6"
    t.integer "city_p6"
    t.integer "total_p6"
    t.integer "player7"
    t.float   "ranking_p7"
    t.integer "board_p7"
    t.integer "military_p7"
    t.integer "treasury_p7"
    t.integer "wonder_p7"
    t.integer "civilian_p7"
    t.integer "science_p7"
    t.integer "commercial_p7"
    t.integer "guilds_p7"
    t.integer "leaders_p7"
    t.integer "city_p7"
    t.integer "total_p7"
    t.integer "player8"
    t.float   "ranking_p8"
    t.integer "board_p8"
    t.integer "military_p8"
    t.integer "treasury_p8"
    t.integer "wonder_p8"
    t.integer "civilian_p8"
    t.integer "science_p8"
    t.integer "commercial_p8"
    t.integer "guilds_p8"
    t.integer "leaders_p8"
    t.integer "city_p8"
    t.integer "total_p8"
  end

  create_table "players", force: :cascade do |t|
    t.string "name"
  end

  create_table "standings2p", force: :cascade do |t|
    t.integer "player"
    t.integer "games_played"
    t.float   "ranking_avg"
    t.integer "1.0"
    t.integer "1.5"
    t.integer "2.0"
  end

  create_table "standings3p", force: :cascade do |t|
    t.integer "player"
    t.integer "games_played"
    t.float   "ranking_avg"
    t.integer "1.0"
    t.integer "1.5"
    t.integer "2.0"
    t.integer "2.5"
    t.integer "3.0"
  end

  create_table "standings4p", force: :cascade do |t|
    t.integer "player"
    t.integer "games_played"
    t.float   "ranking_avg"
    t.integer "1.0"
    t.integer "1.5"
    t.integer "2.0"
    t.integer "2.5"
    t.integer "3.0"
    t.integer "3.5"
    t.integer "4.0"
  end

  create_table "standings5p", force: :cascade do |t|
    t.integer "player"
    t.integer "games_played"
    t.float   "ranking_avg"
    t.integer "1.0"
    t.integer "1.5"
    t.integer "2.0"
    t.integer "2.5"
    t.integer "3.0"
    t.integer "3.5"
    t.integer "4.0"
    t.integer "4.5"
    t.integer "5.0"
  end

  create_table "standings6p", force: :cascade do |t|
    t.integer "player"
    t.integer "games_played"
    t.float   "ranking_avg"
    t.integer "1.0"
    t.integer "1.5"
    t.integer "2.0"
    t.integer "2.5"
    t.integer "3.0"
    t.integer "3.5"
    t.integer "4.0"
    t.integer "4.5"
    t.integer "5.0"
    t.integer "5.5"
    t.integer "6.0"
  end

  create_table "standings7p", force: :cascade do |t|
    t.integer "player"
    t.integer "games_played"
    t.float   "ranking_avg"
    t.integer "1.0"
    t.integer "1.5"
    t.integer "2.0"
    t.integer "2.5"
    t.integer "3.0"
    t.integer "3.5"
    t.integer "4.0"
    t.integer "4.5"
    t.integer "5.0"
    t.integer "5.5"
    t.integer "6.0"
    t.integer "6.5"
    t.integer "7.0"
  end

  create_table "standings8p", force: :cascade do |t|
    t.integer "player"
    t.integer "games_played"
    t.float   "ranking_avg"
    t.integer "1.0"
    t.integer "1.5"
    t.integer "2.0"
    t.integer "2.5"
    t.integer "3.0"
    t.integer "3.5"
    t.integer "4.0"
    t.integer "4.5"
    t.integer "5.0"
    t.integer "5.5"
    t.integer "6.0"
    t.integer "6.5"
    t.integer "7.0"
    t.integer "7.5"
    t.integer "8.0"
  end

end
