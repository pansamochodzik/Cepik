require 'database_cleaner'
DatabaseCleaner.clean_with(:truncation)

p "Creating Cars"

30.times do
  Car.create!(
    name: Faker::Vehicle.manufacture,
    colour: Faker::Vehicle.color,
    vin_number: Faker::Vehicle.vin,
    license_plate: Faker::Vehicle.license_plate,
    year_of_production: @year_of_production = Faker::Vehicle.year,
    year_of_registration: 
      if @year_of_production == Time.now.year
        @year_of_production
      elsif @year_of_production <= Time.now.year && @year_of_production >= 2019
        @year_of_production + Random.rand(0..1)
      else
        @year_of_production + Random.rand(0..2)
      end
  )
end

p "Created #{Car.count} cars"
