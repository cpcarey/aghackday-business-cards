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

ActiveRecord::Schema.define(:version => 20130119180117) do

  create_table "cards", :force => true do |t|
    t.string   "theme"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "url"
  end

  create_table "cards_users", :id => false, :force => true do |t|
    t.integer "card_id"
    t.integer "user_id"
  end

  add_index "cards_users", ["card_id", "user_id"], :name => "index_cards_users_on_card_id_and_user_id"
  add_index "cards_users", ["user_id", "card_id"], :name => "index_cards_users_on_user_id_and_card_id"

  create_table "infos", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "organization"
    t.string   "phone_number"
    t.string   "email"
    t.string   "website"
    t.string   "job_title"
    t.string   "logo_url"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "user_id"
    t.integer  "card_id"
    t.string   "address_line_1"
    t.string   "address_line_2"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "user_sessions", :force => true do |t|
    t.string   "login"
    t.string   "logout"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "login_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "card_id"
  end

end
