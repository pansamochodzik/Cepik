# frozen_string_literal: true

namespace :initial_setup do
  task cars: :environment do
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
  end

  task cars_name: :environment do
    p 'Creating cars names'
    Car.where(name: nil).each do |car|
      car.name = "#{car.brand}_#{car.year_of_production}_#{car.vin_number}"
      car.update
    end
    p 'Created cars names'
  end

  task countries: :environment do
    require 'csv'
    p 'Created countries'
    CSV.foreach(Rails.root.join('lib/csv_files/countries.csv')) do |row|
      Country.create({
                       name: row[0],
                       code: row[1]
                     })
    end
    p "Created #{Country.count} countries"
  end

  task add_user: :environment do
    user = User.create!(
      email: prompt('Email: '),
      password: prompt('Password: '),
      password_confirmation: prompt('Confirm password: ')
    )
    if user.save
        p "User #{user.email} created."
    else
      STDERR.puts('Cannot create a new user:')
      user.errors.full_messages.each do |message|
        STDERR.puts(" * #{message}")
      end
    end
  end

private

  def prompt(message)
    print(message)
    STDIN.gets.chop
  end
end
