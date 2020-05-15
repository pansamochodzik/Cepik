namespace :create do
  task car_list: :environment do
    p "Creating Cars"
    30.times do
      Car.create!(
        name: Faker::Vehicle.manufacture,
        colour: Faker::Vehicle.color,
        vin_number: Faker::Vehicle.vin,
        license_plate: Faker::Vehicle.license_plate,
        year_of_production: @production = Faker::Vehicle.year,
        year_of_registration: @production + Random.rand(0..2)
      )
    end
    p "Created #{Car.count} cars"
  end
end