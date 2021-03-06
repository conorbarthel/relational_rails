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

ActiveRecord::Schema.define(version: 2022_02_03_222324) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "directors", force: :cascade do |t|
    t.string "name"
    t.boolean "active"
    t.integer "awards_won"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "discs", force: :cascade do |t|
    t.string "name"
    t.string "plastic"
    t.integer "speed"
    t.boolean "available"
    t.bigint "producer_id"
    t.index ["producer_id"], name: "index_discs_on_producer_id"
  end

  create_table "movies", force: :cascade do |t|
    t.string "title"
    t.boolean "recently_viewed"
    t.integer "length"
    t.string "genre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "director_id"
    t.index ["director_id"], name: "index_movies_on_director_id"
  end

  create_table "producers", force: :cascade do |t|
    t.string "name"
    t.integer "number_of_athletes"
    t.boolean "free_shipping"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "discs", "producers"
  add_foreign_key "movies", "directors"
end
