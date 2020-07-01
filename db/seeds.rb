# frozen_string_literal: true

require 'csv'
require 'database_cleaner'

DatabaseCleaner.clean_with(:truncation)

p 'Created countries'

CSV.foreach(Rails.root.join('lib/csv_files/countries.csv')) do |row|
  Country.create({
                   name: row[0],
                   code: row[1]
                 })
end

p "Created #{Country.count} countries"

p 'Creating Cars'

30.times do
  Car.create!(
    brand: Faker::Vehicle.make,
    colour: Faker::Vehicle.color,
    vin_number: Faker::Vehicle.vin,
    license_plate: Faker::Vehicle.license_plate,
    country_id: Random.rand(1..225),
    year_of_production: year_of_production = Faker::Vehicle.year,
    year_of_registration: year_of_production
  )
end

p "Created #{Car.count} cars"
