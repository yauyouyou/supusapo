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

ActiveRecord::Schema[7.0].define(version: 2023_07_26_082703) do
  create_table "client_details", charset: "utf8", force: :cascade do |t|
    t.string "title", null: false
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "client_id"
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_client_details_on_user_id"
  end

  create_table "clients", charset: "utf8", force: :cascade do |t|
    t.string "client_firstname", null: false
    t.string "client_lastname", null: false
    t.string "client_firstname_kana", null: false
    t.string "client_lastname_kana", null: false
    t.date "birthday", null: false
    t.integer "gender_id", null: false
    t.string "post_code", null: false
    t.integer "prefecture_id", null: false
    t.string "municipality", null: false
    t.string "address", null: false
    t.string "building_name"
    t.string "phone_number"
    t.string "mobile_number"
    t.string "company_name"
    t.text "project"
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_clients_on_user_id"
  end

  create_table "schedules", charset: "utf8", force: :cascade do |t|
    t.datetime "start_time"
    t.datetime "end_time"
    t.string "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "client_id", null: false
    t.index ["client_id"], name: "index_schedules_on_client_id"
  end

  create_table "users", charset: "utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "last_name"
    t.string "first_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "client_details", "users"
  add_foreign_key "clients", "users"
  add_foreign_key "schedules", "clients"
end
