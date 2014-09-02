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

ActiveRecord::Schema.define(version: 20140902090747) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "badges", force: true do |t|
    t.integer  "user_id"
    t.integer  "exercise_id"
    t.integer  "level"
    t.integer  "meta"
    t.integer  "certification"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "badges", ["exercise_id"], name: "index_badges_on_exercise_id", using: :btree
  add_index "badges", ["user_id"], name: "index_badges_on_user_id", using: :btree

  create_table "exercises", force: true do |t|
    t.string   "unique_name"
    t.string   "title"
    t.text     "content_body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "medals", force: true do |t|
    t.integer  "exercise_id"
    t.integer  "user_id"
    t.integer  "metacongnize"
    t.integer  "submit_id"
    t.integer  "target_badge"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "medals", ["exercise_id"], name: "index_medals_on_exercise_id", using: :btree
  add_index "medals", ["submit_id"], name: "index_medals_on_submit_id", using: :btree
  add_index "medals", ["user_id"], name: "index_medals_on_user_id", using: :btree

  create_table "submits", force: true do |t|
    t.integer  "user_id"
    t.integer  "exercise_id"
    t.string   "result"
    t.integer  "try_count"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.binary   "content"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
