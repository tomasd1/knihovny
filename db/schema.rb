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

ActiveRecord::Schema[7.0].define(version: 2023_02_27_145608) do
  create_table "cities", primary_key: "code", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "districts", primary_key: "code", id: { type: :string, limit: 6 }, force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "libraries", force: :cascade do |t|
    t.string "name"
    t.integer "ico", limit: 8
    t.string "street"
    t.integer "premise", limit: 5
    t.integer "postcode", limit: 5
    t.decimal "x", precision: 7, scale: 4
    t.decimal "y", precision: 7, scale: 4
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "city_id", null: false
    t.string "region_id", limit: 5, null: false
    t.integer "orp_id", null: false
    t.string "district_id", limit: 6, null: false
    t.index ["city_id"], name: "index_libraries_on_city_id"
    t.index ["district_id"], name: "index_libraries_on_district_id"
    t.index ["orp_id"], name: "index_libraries_on_orp_id"
    t.index ["region_id"], name: "index_libraries_on_region_id"
  end

  create_table "orps", primary_key: "code", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "regions", primary_key: "code", id: { type: :string, limit: 5 }, force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "libraries", "cities", primary_key: "code"
  add_foreign_key "libraries", "districts", primary_key: "code"
  add_foreign_key "libraries", "orps", primary_key: "code"
  add_foreign_key "libraries", "regions", primary_key: "code"
end
