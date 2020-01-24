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

ActiveRecord::Schema.define(version: 2020_01_24_005228) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "adopts", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "animal_id", null: false
    t.string "status"
    t.string "adopt_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["animal_id"], name: "index_adopts_on_animal_id"
    t.index ["user_id"], name: "index_adopts_on_user_id"
  end

  create_table "animal_types", force: :cascade do |t|
    t.string "type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "animals", force: :cascade do |t|
    t.string "name"
    t.datetime "birthday"
    t.bigint "animal_type_id", null: false
    t.string "location"
    t.string "details"
    t.string "photo"
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["animal_type_id"], name: "index_animals_on_animal_type_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.string "cpf"
    t.string "street"
    t.string "number"
    t.string "city"
    t.string "state"
    t.string "details"
    t.string "status"
  end

  add_foreign_key "adopts", "animals"
  add_foreign_key "adopts", "users"
  add_foreign_key "animals", "animal_types"
end
