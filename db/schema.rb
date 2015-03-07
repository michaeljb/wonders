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

ActiveRecord::Schema.define(version: 20150307035250) do

  create_table "boards", force: :cascade do |t|
    t.string "name"
    t.string "side", limit: 1
  end

  create_table "games", force: :cascade do |t|
    t.date    "date"
    t.boolean "cities"
    t.boolean "leaders"
    t.integer "player1"
    t.integer "board_p1"
    t.integer "military_p1"
    t.integer "treasury_p1"
    t.integer "wonder_p1"
    t.integer "civilian_p1"
    t.integer "science_p1"
    t.integer "commercial_p1"
    t.integer "guilds_p1"
    t.integer "total_p1"
    t.integer "ranking_p1"
    t.integer "player2"
    t.integer "board_p2"
    t.integer "military_p2"
    t.integer "treasury_p2"
    t.integer "wonder_p2"
    t.integer "civilian_p2"
    t.integer "science_p2"
    t.integer "commercial_p2"
    t.integer "guilds_p2"
    t.integer "total_p2"
    t.integer "ranking_p2"
    t.integer "player3"
    t.integer "board_p3"
    t.integer "military_p3"
    t.integer "treasury_p3"
    t.integer "wonder_p3"
    t.integer "civilian_p3"
    t.integer "science_p3"
    t.integer "commercial_p3"
    t.integer "guilds_p3"
    t.integer "total_p3"
    t.integer "ranking_p3"
    t.integer "player4"
    t.integer "board_p4"
    t.integer "military_p4"
    t.integer "treasury_p4"
    t.integer "wonder_p4"
    t.integer "civilian_p4"
    t.integer "science_p4"
    t.integer "commercial_p4"
    t.integer "guilds_p4"
    t.integer "total_p4"
    t.integer "ranking_p4"
    t.integer "player5"
    t.integer "board_p5"
    t.integer "military_p5"
    t.integer "treasury_p5"
    t.integer "wonder_p5"
    t.integer "civilian_p5"
    t.integer "science_p5"
    t.integer "commercial_p5"
    t.integer "guilds_p5"
    t.integer "total_p5"
    t.integer "ranking_p5"
    t.integer "player6"
    t.integer "board_p6"
    t.integer "military_p6"
    t.integer "treasury_p6"
    t.integer "wonder_p6"
    t.integer "civilian_p6"
    t.integer "science_p6"
    t.integer "commercial_p6"
    t.integer "guilds_p6"
    t.integer "total_p6"
    t.integer "ranking_p6"
    t.integer "player7"
    t.integer "board_p7"
    t.integer "military_p7"
    t.integer "treasury_p7"
    t.integer "wonder_p7"
    t.integer "civilian_p7"
    t.integer "science_p7"
    t.integer "commercial_p7"
    t.integer "guilds_p7"
    t.integer "total_p7"
    t.integer "ranking_p7"
  end

  create_table "players", force: :cascade do |t|
    t.string "name"
  end

end
