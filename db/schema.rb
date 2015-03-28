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

ActiveRecord::Schema.define(version: 20150328180031) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ideas", force: :cascade do |t|
    t.string   "title"
    t.text     "explanation"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
  end

  add_index "ideas", ["user_id"], name: "index_ideas_on_user_id", using: :btree

  create_table "pledges", force: :cascade do |t|
    t.integer  "amount"
    t.string   "stripe_txn_id"
    t.string   "aasm_state"
    t.integer  "user_id"
    t.integer  "idea_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "pledges", ["idea_id"], name: "index_pledges_on_idea_id", using: :btree
  add_index "pledges", ["user_id"], name: "index_pledges_on_user_id", using: :btree

  create_table "tweets", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "tweets", ["user_id"], name: "index_tweets_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                   default: "", null: false
    t.string   "encrypted_password",      default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",           default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "provider"
    t.string   "uid"
    t.string   "twitter_consumer_token"
    t.string   "twitter_consumer_secret"
    t.text     "omniauth_raw_data"
    t.string   "stripe_customer_token"
    t.string   "stripe_last4"
    t.string   "stripe_card_type"
  end

  add_index "users", ["email"], name: "index_users_on_email", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "ideas", "users"
  add_foreign_key "pledges", "ideas"
  add_foreign_key "pledges", "users"
  add_foreign_key "tweets", "users"
end
