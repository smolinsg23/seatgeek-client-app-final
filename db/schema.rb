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

ActiveRecord::Schema.define(version: 20170316045234) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bid_event_histories", force: :cascade do |t|
    t.integer  "bid_event_id"
    t.decimal  "lowest_price", precision: 5, scale: 2, null: false
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.index ["bid_event_id"], name: "index_bid_event_histories_on_bid_event_id", using: :btree
  end

  create_table "bid_events", force: :cascade do |t|
    t.string   "event_id"
    t.decimal  "current_buy_now_price", precision: 5, scale: 2, null: false
    t.datetime "expiration_date",                               null: false
  end

  create_table "bids", force: :cascade do |t|
    t.integer  "event_id"
    t.integer  "user_id"
    t.integer  "bid"
    t.string   "lowest_price"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "matched_price"
    t.string   "event_title"
  end

  create_table "buy_now_bids", force: :cascade do |t|
    t.integer  "bid_id"
    t.integer  "lowest_price"
    t.integer  "average_price"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "events", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "user_name"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
