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

ActiveRecord::Schema[7.0].define(version: 2022_08_25_005305) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "street"
    t.string "town"
    t.integer "zip_code"
    t.string "state"
    t.string "country"
    t.bigint "people_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["people_id"], name: "index_addresses_on_people_id"
  end

  create_table "emails", force: :cascade do |t|
    t.string "email_address"
    t.text "comment"
    t.bigint "people_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["people_id"], name: "index_emails_on_people_id"
  end

  create_table "numbers", force: :cascade do |t|
    t.integer "phone_number"
    t.text "comment"
    t.bigint "people_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["people_id"], name: "index_numbers_on_people_id"
  end

  create_table "people", force: :cascade do |t|
    t.string "salutation"
    t.string "first_name"
    t.string "middle_name"
    t.string "last_name"
    t.integer "ssn"
    t.date "birth_date"
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "addresses", "people", column: "people_id"
  add_foreign_key "emails", "people", column: "people_id"
  add_foreign_key "numbers", "people", column: "people_id"
end
