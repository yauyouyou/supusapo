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

ActiveRecord::Schema[7.0].define(version: 2023_07_19_070921) do
  create_table "client_details", charset: "utf8", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "client_id"
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
  end

  create_table "fields", charset: "utf8", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.bigint "client_detail_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_detail_id"], name: "index_fields_on_client_detail_id"
  end

  add_foreign_key "fields", "client_details"
end
