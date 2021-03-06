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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130308185346) do

  create_table "accounts", :force => true do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "oauth_token"
    t.string   "oauth_token_secret"
    t.boolean  "main"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "pages", :force => true do |t|
    t.string   "title"
    t.string   "media"
    t.string   "url"
    t.text     "content"
    t.integer  "tweet_id"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
    t.integer  "state",      :default => 0
  end

  create_table "tweets", :force => true do |t|
    t.string   "tweet_id"
    t.integer  "account_id"
    t.hstore   "urls"
    t.datetime "created_at"
  end

  add_index "tweets", ["urls"], :name => "index_tweets_on_urls"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "oauth_token"
    t.string   "oauth_token_secret"
    t.string   "avatar"
  end

end
