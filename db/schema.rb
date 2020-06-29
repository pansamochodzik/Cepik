# frozen_string_literal: true

ActiveRecord::Schema.define(version: 20_200_628_185_651) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'cars', force: :cascade do |t|
    t.string 'brand'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'colour'
    t.string 'vin_number'
    t.string 'license_plate'
    t.integer 'year_of_production'
    t.integer 'year_of_registration'
    t.string 'registration_country'
    t.string 'name'
    t.index ['license_plate'], name: 'index_cars_on_license_plate', unique: true
    t.index ['vin_number'], name: 'index_cars_on_vin_number', unique: true
  end

  create_table 'countries', force: :cascade do |t|
    t.string 'country'
    t.string 'country_code'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['country'], name: 'index_countries_on_country', unique: true
    t.index ['country_code'], name: 'index_countries_on_country_code', unique: true
  end
end
