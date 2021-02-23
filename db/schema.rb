# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_02_23_094100) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "challenges", force: :cascade do |t|
    t.string "name"
    t.integer "category"
    t.integer "place"
    t.text "content"
    t.integer "xp"
    t.integer "delay"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "difficulty"
  end

  create_table "chatrooms", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "dares", force: :cascade do |t|
    t.integer "progress", default: 0, null: false
    t.bigint "user_id", null: false
    t.bigint "challenge_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["challenge_id"], name: "index_dares_on_challenge_id"
    t.index ["user_id"], name: "index_dares_on_user_id"
  end

  create_table "journeys", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.boolean "public"
    t.integer "challenge_rating"
    t.text "challenge_review"
    t.bigint "user_id", null: false
    t.bigint "dare_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["dare_id"], name: "index_journeys_on_dare_id"
    t.index ["user_id"], name: "index_journeys_on_user_id"
  end

  create_table "levels", force: :cascade do |t|
    t.string "rank"
    t.integer "xp_requirement"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "messages", force: :cascade do |t|
    t.string "content"
    t.bigint "user_id", null: false
    t.bigint "challenge_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["challenge_id"], name: "index_messages_on_challenge_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "username"
    t.date "birth_date"
    t.text "presentation"
    t.string "address"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "dares", "challenges"
  add_foreign_key "dares", "users"
  add_foreign_key "journeys", "dares"
  add_foreign_key "journeys", "users"
  add_foreign_key "messages", "challenges"
  add_foreign_key "messages", "users"
end
