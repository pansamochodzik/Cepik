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

ActiveRecord::Schema.define(version: 2020_06_04_192708) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cars", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "colour"
    t.string "vin_number"
    t.string "license_plate"
    t.integer "year_of_production"
    t.integer "year_of_registration"
    t.string "registration_country"
    t.string "name_id"
    t.index ["license_plate"], name: "index_cars_on_license_plate", unique: true
    t.index ["vin_number"], name: "index_cars_on_vin_number", unique: true
  end

  create_table "countries", force: :cascade do |t|
    t.string "country"
    t.string "country_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country"], name: "index_countries_on_country", unique: true
    t.index ["country_code"], name: "index_countries_on_country_code", unique: true
  end

end
