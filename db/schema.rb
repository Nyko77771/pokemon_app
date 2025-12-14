# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2025_12_13_150249) do
  create_table "cards", force: :cascade do |t|
    t.string "name"
    t.string "set_name"
    t.string "card_number"
    t.string "damage"
    t.string "card_text"
    t.string "rarity"
    t.string "image_url"
    t.float "market_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cards_in_lists", force: :cascade do |t|
    t.integer "list_id", null: false
    t.integer "card_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["card_id"], name: "index_cards_in_lists_on_card_id"
    t.index ["list_id"], name: "index_cards_in_lists_on_list_id"
  end

  create_table "lists", force: :cascade do |t|
    t.string "name"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_lists_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "email", null: false
    t.string "password_digest", null: false
  end

  add_foreign_key "cards_in_lists", "cards"
  add_foreign_key "cards_in_lists", "lists"
  add_foreign_key "lists", "users"
end
