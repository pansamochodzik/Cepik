namespace :initial_setup do
  task cars: :environment do
    p 'Creating Cars'
    30.times do
      Car.create!(
        brand: Faker::Vehicle.make,
        colour: Faker::Vehicle.color,
        vin_number: Faker::Vehicle.vin,
        license_plate: Faker::Vehicle.license_plate,
        year_of_production: year_of_production = Faker::Vehicle.year,
        year_of_registration: year_of_production,
      )
    end
    p "Created #{Car.count} cars"
  end

  task cars_name: :environment do
    p 'Creating cars names'
    Car.where(name: nil).each do |car|
      car.name = "#{car.brand}_#{car.year_of_production}_#{car.vin_number}"
      car.update
    end
    p "Created cars names"
  end
end
