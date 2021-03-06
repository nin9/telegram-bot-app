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

ActiveRecord::Schema.define(version: 2021_05_28_161138) do

  create_table "chats", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "telegram_id"
    t.bigint "offset", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["telegram_id"], name: "index_chats_on_telegram_id"
  end

  create_table "messages", force: :cascade do |t|
    t.integer "chat_id"
    t.string "sender_first_name"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chat_id"], name: "index_messages_on_chat_id"
  end

end
