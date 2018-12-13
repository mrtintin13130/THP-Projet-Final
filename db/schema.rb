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

ActiveRecord::Schema.define(version: 2018_12_06_103337) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.integer "size"
    t.boolean "status"
    t.bigint "user_id"
    t.bigint "category_id"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_articles_on_category_id"
    t.index ["user_id"], name: "index_articles_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "exchanges", force: :cascade do |t|
    t.bigint "applicant_user_id"
    t.bigint "owner_user_id"
    t.bigint "applicant_article_id"
    t.bigint "owner_article_id"
    t.boolean "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["applicant_article_id"], name: "index_exchanges_on_applicant_article_id"
    t.index ["applicant_user_id"], name: "index_exchanges_on_applicant_user_id"
    t.index ["owner_article_id"], name: "index_exchanges_on_owner_article_id"
    t.index ["owner_user_id"], name: "index_exchanges_on_owner_user_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.bigint "main_user_id"
    t.bigint "favorite_user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["favorite_user_id"], name: "index_favorites_on_favorite_user_id"
    t.index ["main_user_id"], name: "index_favorites_on_main_user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.bigint "user_id"
    t.text "content"
    t.integer "dest_user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "birth_date"
    t.boolean "admin", default: false
    t.boolean "premium_user", default: false
    t.string "sex"
    t.integer "code_confirm"
    t.string "image"
    t.string "avatar"
    t.string "phone"
    t.string "city"
    t.string "username"
    t.boolean "phone_verified", default: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "messages", "users"
end
