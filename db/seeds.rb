require 'database_cleaner'
DatabaseCleaner.clean_with(:truncation)

p "Creating Cars"

30.times do
  Car.create!(
    name: Faker::Vehicle.manufacture,
    colour: Faker::Vehicle.color
  )
end

p "Created #{Car.count} cars"
