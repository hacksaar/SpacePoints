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

ActiveRecord::Schema.define(version: 20140209154606) do

  create_table "cancels", force: true do |t|
    t.integer  "hacker_id"
    t.integer  "user_id"
    t.integer  "subject_id"
    t.string   "subject_type"
    t.string   "chronicle_text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "earnings", force: true do |t|
    t.integer  "hacker_id"
    t.integer  "user_id"
    t.integer  "quest_id"
    t.integer  "points"
    t.string   "chronicle_text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "hackers", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "nickname"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "hackers", ["email"], name: "index_hackers_on_email", unique: true
  add_index "hackers", ["reset_password_token"], name: "index_hackers_on_reset_password_token", unique: true

  create_table "quests", force: true do |t|
    t.integer  "points"
    t.string   "title"
    t.string   "description"
    t.string   "image_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "redemptions", force: true do |t|
    t.integer  "hacker_id"
    t.integer  "user_id"
    t.integer  "reward_id"
    t.integer  "points"
    t.string   "chronicle_text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rewards", force: true do |t|
    t.integer  "points"
    t.string   "title"
    t.string   "image_url"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
