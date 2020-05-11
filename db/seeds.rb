require 'database_cleaner'
DatabaseCleaner.clean_with(:truncation)

p "Creating Cars"

30.times do
  Car.create!(
    name: Faker::Vehicle.manufacture,
    colour: Faker::Vehicle.color,
    vin_number: Faker::Vehicle.vin,
    license_plate: Faker::Vehicle.license_plate,
    production_at: @production = Faker::Vehicle.year,
    registration_at: @production + Random.rand(0..2)
  )
end

p "Created #{Car.count} cars"
