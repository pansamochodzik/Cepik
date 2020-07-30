# frozen_string_literal: true

require 'csv'
require 'database_cleaner'

DatabaseCleaner.clean_with(:truncation)

p 'Created countries'

CSV.foreach(Rails.root.join('app/db/seeds/countries.csv')) do |row|
  Country.create({
                   name: row[0],
                   code: row[1]
                 })
end

p "Created #{Country.count} countries"

p 'Creating Cars'

40.times do
  car = Car.new(
    brand: Faker::Vehicle.make,
    colour: Faker::Vehicle.color,
    vin_number: Faker::Vehicle.vin,
    license_plate: Faker::Vehicle.license_plate,
    country_id: Random.rand(1..225),
    year_of_production: year_of_production = Faker::Vehicle.year,
    year_of_registration: year_of_production
  )
  car.save
  car.mileages.build.update(distance: Random.rand(10000..600000))
end
# car.update(mileagas_attributes[distance: Random.rand(10000..600000)]
p "Created #{Car.count} cars"

p 'Creating users'

admin = User.new(
  email: 'admin@admin.com',
  password: 'password',
  password_confirmation: 'password',
  admin: true
)

user = User.new(
  email: 'user@user.com',
  password: 'password',
  password_confirmation: 'password',
  admin: false
)

admin.skip_confirmation!
admin.save!
user.skip_confirmation!
user.save!

p "Created #{User.count} users"
