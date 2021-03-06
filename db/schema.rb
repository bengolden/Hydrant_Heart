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

ActiveRecord::Schema.define(version: 20140604162837) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "arguments", force: true do |t|
    t.integer  "author_id"
    t.integer  "conclusion_id"
    t.boolean  "is_supporting"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "assumptions", force: true do |t|
    t.integer  "premise_id"
    t.integer  "argument_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "claims", force: true do |t|
    t.integer  "author_id"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "password_hash"
    t.string   "image_url",     default: "http://fc08.deviantart.net/fs70/f/2012/199/4/3/eddsworld___unknown_profile_by_xnamenloserx-d57qvfm.jpg"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "votes", force: true do |t|
    t.integer  "user_id"
    t.integer  "voteable_id"
    t.string   "voteable_type"
    t.boolean  "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
