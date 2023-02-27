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
  create_table "cities", primary_key: "kod_obce", force: :cascade do |t|
    t.string "nazev_obce", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "districts", primary_key: "kod_okresu", id: { type: :string, limit: 6 }, force: :cascade do |t|
    t.string "nazev_okresu", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "libraries", force: :cascade do |t|
    t.string "nazev"
    t.integer "ico", limit: 8
    t.string "ulice"
    t.integer "cislo_domovni", limit: 5
    t.integer "psc", limit: 5
    t.decimal "x", precision: 7, scale: 4
    t.decimal "y", precision: 7, scale: 4
    t.integer "lib_region", null: false
    t.integer "lib_district", null: false
    t.integer "lib_orp", null: false
    t.integer "lib_city", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lib_city"], name: "index_libraries_on_lib_city"
    t.index ["lib_district"], name: "index_libraries_on_lib_district"
    t.index ["lib_orp"], name: "index_libraries_on_lib_orp"
    t.index ["lib_region"], name: "index_libraries_on_lib_region"
  end

  create_table "orps", primary_key: "kod_orp", force: :cascade do |t|
    t.string "nazev_orp", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "regions", primary_key: "kod_vusc", id: { type: :string, limit: 5 }, force: :cascade do |t|
    t.string "nazev_vusc", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "libraries", "cities", column: "lib_city", primary_key: "kod_obce"
  add_foreign_key "libraries", "districts", column: "lib_district", primary_key: "kod_okresu"
  add_foreign_key "libraries", "orps", column: "lib_orp", primary_key: "kod_orp"
  add_foreign_key "libraries", "regions", column: "lib_region", primary_key: "kod_vusc"
end
