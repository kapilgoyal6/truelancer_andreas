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

ActiveRecord::Schema.define(version: 2021_10_19_091751) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "data_source_metadata", force: :cascade do |t|
    t.string "code"
    t.bigint "data_source_id", null: false
    t.string "name"
    t.text "description"
    t.datetime "refreshed_at"
    t.date "from_date"
    t.date "to_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["data_source_id"], name: "index_data_source_metadata_on_data_source_id"
  end

  create_table "data_sources", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "historical_price_data", force: :cascade do |t|
    t.date "date"
    t.float "high"
    t.float "low"
    t.float "open"
    t.float "close"
    t.bigint "volume"
    t.json "additional_data"
    t.string "type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "instruments", force: :cascade do |t|
    t.string "ric"
    t.string "name"
    t.bigint "data_source_id"
    t.string "third_party_instrument"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["data_source_id"], name: "index_instruments_on_data_source_id"
  end

  add_foreign_key "data_source_metadata", "data_sources"
  add_foreign_key "instruments", "data_sources"
end
