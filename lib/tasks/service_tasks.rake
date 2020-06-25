namespace :initial_setup do
  task cars: :environment do
    p 'Creating Cars'
    30.times do
      Car.create!(
        name: Faker::Vehicle.make,
        colour: Faker::Vehicle.color,
        vin_number: Faker::Vehicle.vin,
        license_plate: Faker::Vehicle.license_plate,
        registration_country: 'PL',
        year_of_production: @year_of_production = Faker::Vehicle.year,
        year_of_registration: @year_of_production
      )
    end
    p "Created #{Car.count} cars"
  end

  task countries: :environment do
    require 'csv'
    p 'Created countries'
    CSV.foreach(Rails.root.join('lib/csv_files/countries.csv')) do |row|

      Country.create({
        country: row[0],
        country_code: row[1]
        })
    end
    p "Created #{Country.count} countries"
  end
end
