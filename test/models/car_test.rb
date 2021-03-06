# frozen_string_literal: true

require 'test_helper'

class CarTest < ActiveSupport::TestCase
  def setup
    @car = cars(:mercedes)
    @second_car = cars(:toyota)
    @chars = %w(! @ # $ % ' ^ & * ( ) _ + { } | : " > ? < [ ] | = ; . ~ ` ,)
  end

  test 'checking validation cars data from fixtures' do
    assert @car.valid?
    assert @second_car.valid?
  end

  # tests for brand validation:
  test 'car brand can be blank?' do
    @car.brand = ''
    assert @car.invalid?
  end

  test 'car brand can have more than 15 characters?' do
    @car.brand = 'abcdefghijklmnop'
    assert @car.invalid?
  end

  test 'car brand can have numbers?' do
    @car.brand = 'Honda666'
    assert @car.invalid?
  end

  test 'car brand can have spaces?' do
    @car.brand = 'Aston Martin'
    assert @car.invalid?
  end

  test 'car brand can have dash as the first character?' do
    @car.brand = '-Aston-Martin'
    assert @car.invalid?
  end

  test 'car brand can have dash as the last character?' do
    @car.brand = 'Aston-Martin-'
    assert @car.invalid?
  end

  test 'car brand accepts any special character except dash' do
    @chars.each do |char|
      @car.brand[1] = @car.brand[1].replace char.to_s
      assert @car.invalid?
    end
  end

  test 'car brand can be the same for many cars?' do
    @second_car.brand = @car.brand
    assert @second_car.valid?
  end

  # tests for colour validation:
  test 'car colour can be blank?' do
    @car.colour = ''
    assert @car.invalid?
  end

  test 'car colour can have more than 20 characters?' do
    @car.colour = 'canhavetwentycharacters'
    assert @car.invalid?
  end

  test 'car colour can have numbers?' do
    @car.colour = 'Red666'
    assert @car.invalid?
  end

  test 'car colour can have spaces?' do
    @car.colour = 'Gray Metallic'
    assert @car.invalid?
  end

  test 'car colour can have dash as the first character?' do
    @car.colour = '-Gray-Metallic'
    assert @car.invalid?
  end

  test 'car colour can have dash as the last character?' do
    @car.colour = 'Gray-Metallic-'
    assert @car.invalid?
  end

  test 'car colour accepts any special character except dash?' do
    @chars.each do |char|
      @car.colour[1] = @car.colour[1].replace char.to_s
      assert @car.invalid?
    end
  end

  test 'car colour can be the same for many cars?' do
    @second_car.colour = @car.colour
    assert @second_car.valid?
  end

  # tests for vin_number validation:
  test 'car vin number can be blank?' do
    @car.vin_number = ''
    assert @car.invalid?
  end

  test 'car vin number can have lass than 17 characters?' do
    @car.vin_number = 'ABCDE12345123456'
    assert @car.invalid?
  end

  test 'car vin number can have more than 17 characters?' do
    @car.vin_number = 'ABCDE1234512345678'
    assert @car.invalid?
  end

  test 'car vin number can have small letters?' do
    @car.vin_number = 'abcdeabcdeabcdeab'
    assert @car.invalid?
  end

  test 'car vin number is unique?' do
    @second_car.vin_number = @car.vin_number
    assert @second_car.invalid?
  end

  test 'car vin number accepts any special character?' do
    @chars.each do |chars|
      @car.vin_number[1] = @car.vin_number[1].replace chars.to_s
      assert @car.invalid?
    end
  end

  # tests for license_plate validation:
  test 'car license plate can be blank?' do
    @car.license_plate = ''
    assert @car.invalid?
  end

  test 'car license plate can have dash as the first character?' do
    @car.license_plate = '-ABC1234'
    assert @car.invalid?
  end

  test 'car license plate can have dash as the second character?' do
    @car.license_plate = 'A-BC1234'
    assert @car.invalid?
  end

  test 'car license plate can have dash as the third character?' do
    @car.license_plate = 'AB-C1234'
    assert @car.valid?
  end

  test 'car license plate can have dash as the fourth character?' do
    @car.license_plate = 'ABC-1234'
    assert @car.valid?
  end

  test 'car license plate can have a dash as the fifth character?' do
    @car.license_plate = 'ABCD-123'
    assert @car.invalid?
  end

  test 'car license plate can have a dash as the sixth character?' do
    @car.license_plate = 'ABCDE-12'
    assert @car.invalid?
  end

  test 'car license plate can have a dash as the seventh character?' do
    @car.license_plate = 'ABCDEF-1'
    assert @car.invalid?
  end

  test 'car license plate can have a dash as the eighth character?' do
    @car.license_plate = 'ABCDEFG-'
    assert @car.invalid?
  end

  test 'car license plate can have small letters?' do
    @car.license_plate = 'ab-abcd1'
    assert @car.invalid?
  end

  test 'car license plate is unique?' do
    @second_car.license_plate = @car.license_plate
    assert @second_car.invalid?
  end

  test 'car license plate accepts any special character?' do
    @chars.each do |chars|
      @car.license_plate[1] = @car.license_plate[1].replace chars.to_s
      assert @car.invalid?
    end
  end

  # tests for year_of_production validation:
  test 'car year of production can be blank?' do
    @car.year_of_production = ''
    assert @car.invalid?
  end

  test 'car year of production can less than 4 characters?' do
    @car.year_of_production = 123
    assert @car.invalid?
  end

  test 'car year of production can have more than 4 character?' do
    @car.year_of_production = 12345
    assert @car.invalid?
  end

  test 'car year of production can be less than 1900?' do
    @car.year_of_production = 1899
    assert @car.invalid?
  end

  test 'car year of production can be higher than actual year?' do
    @car.year_of_production = Time.now.year + 1
    assert @car.invalid?
  end

  test 'car year of production should be a numeric?' do
    @car.year_of_production = 'ABCZ'
    assert @car.invalid?
  end

  # tests for year_of_registration validation:
  test 'car year of registration can be blank?' do
    @car.year_of_registration = ''
    assert @car.invalid?
  end

  test 'car year of registration can less than 4 characters?' do
    @car.year_of_registration = 123
    assert @car.invalid?
  end

  test 'car year of registration can have more than 4 character?' do
    @car.year_of_registration = 12345
    assert @car.invalid?
  end

  test 'car year of registration can be less than 1900?' do
    @car.year_of_registration = 1899
    assert @car.invalid?
  end

  test 'car year of registration can be higher than actual year?' do
    @car.year_of_registration = Time.now.year + 1
    assert @car.invalid?
  end

  test 'car year of registration should be a numeric?' do
    @car.year_of_registration = 'ABCZ'
    assert @car.invalid?
  end

  # test for name presents:
  test 'autogenerate car name' do
    car = Car.create!(
      brand: 'Mercedes-Benz',
      colour: 'Gray-Metallic',
      vin_number: 'ASDFFHJKL12345672',
      license_plate: 'WHA-WOA2',
      country_id: @car.country_id,
      year_of_production: 2012,
      year_of_registration: 2012,
      name: nil
    )

    assert_equal 'Mercedes-Benz_2012_ASDFFHJKL12345672', car.name
  end
end
