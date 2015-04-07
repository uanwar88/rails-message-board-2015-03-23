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

ActiveRecord::Schema.define(version: 20150329023531) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "boards", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "location_id"
  end

  add_index "boards", ["location_id"], name: "index_boards_on_location_id", using: :btree

  create_table "locations", force: :cascade do |t|
    t.string   "city"
    t.string   "state"
    t.string   "abbrstate"
    t.integer  "zip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mb_threads", force: :cascade do |t|
    t.string   "title"
    t.integer  "board_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "mb_threads", ["board_id"], name: "index_mb_threads_on_board_id", using: :btree
  add_index "mb_threads", ["user_id"], name: "index_mb_threads_on_user_id", using: :btree

  create_table "posts", force: :cascade do |t|
    t.text     "message"
    t.integer  "user_id"
    t.integer  "mb_thread_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "posts", ["mb_thread_id"], name: "index_posts_on_mb_thread_id", using: :btree
  add_index "posts", ["user_id"], name: "index_posts_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.integer  "total_posts",     default: 0
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "password_digest"
    t.integer  "admin"
    t.string   "email"
  end

  add_foreign_key "boards", "locations"
  add_foreign_key "mb_threads", "boards"
  add_foreign_key "mb_threads", "users"
  add_foreign_key "posts", "mb_threads"
  add_foreign_key "posts", "users"
end
